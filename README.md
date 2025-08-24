# Skill Playground

## Índice
- [Descrição](#descrição)
- [Decisões de Arquitetura](#decisões-de-arquitetura)
  - [Uso de DTOs (models)](#uso-de-dtos-models)
  - [Result Pattern](#result-pattern)
  - [Depender de abstrações e não de implementações](#depender-de-abstrações-e-não-de-implementações)
  - [Injeção de Dependência](#injeção-de-dependência)
  - [Quebrando a arquitetura: o uso de ChangeNotifier nas rotas](#quebrando-a-arquitetura-o-uso-de-changenotifier-nas-rotas)
  - [Analyzer e Lint](#analyzer-e-lint)
  - [Arquitetura Limpa (Clean Architecture)](#arquitetura-limpa-clean-architecture)
- [Pacotes usados](#pacotes-usados)
  - [Dependências](#dependências)
  - [Dependências de desenvolvimento](#dependências-de-desenvolvimento)
- [Desafios encontrados e soluções](#desafios-encontrados-e-soluções)
- [Funcionalidades](#funcionalidades)
  - [1. Home](#1-home)
  - [2. CustomPainter Screen](#2-custompainter-screen)
  - [3. Router 2.0 Screen](#3-router-20-screen)
  - [4. Bloc Screen](#4-bloc-screen)
  - [5. Platform Channels Screen](#5-platform-channels-screen)
  - [6. Performance Screen](#6-performance-screen)
  - [7. Isolate Screen](#7-isolate-screen)
  - [8. AnimationController Screen](#8-animationcontroller-screen)
  - [9. StreamBuilder Screen](#9-streambuilder-screen)
  - [10. Slivers Screen](#10-slivers-screen)
- [O que poderia ser melhorado](#o-que-poderia-ser-melhorado)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)


## Descrição

Este projeto é um playground para praticar e demonstrar diversas habilidades e conceitos avançados em Flutter. Ele inclui várias telas, cada uma focada em um aspecto específico do desenvolvimento Flutter, como CustomPainter, Router 2.0, BLoC, Platform Channels, Performance, Isolates, AnimationController, StreamBuilder, Slivers e Dependency Injection.

## Decisões de Arquitetura

### Uso de DTOs (models)

- Cada Model é serializável (ex: PlaceLocalModel.fromJson).
- Marshalling: fromJson pega os dados brutos e os transforma em um objeto PlaceLocalModel.
- Encapsulamento e Imutabilidade: com `@freezed` a classe é imutável (nenhum de seus valores pode ser alterado).

Abaixo um exemplo de um DTO (Data Transfer Object) usado no projeto:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_local_model.freezed.dart';
part 'place_local_model.g.dart';

@freezed
abstract class PlaceLocalModel with _$PlaceLocalModel {
  const factory PlaceLocalModel({
    required String ref,
    required String name,
    required String country,
    required String type,
    required String imageUrl,
    required String title,
  }) = _PlaceLocalModel;

  factory PlaceLocalModel.fromJson(Map<String, Object?> json) =>
      _$PlaceLocalModelFromJson(json);
}
```

### Result Pattern

Um problema comum no desenvolvimento é o uso de try-catch em vários lugares da aplicação. Quando temos métodos muito grandes ou quando um BLoC utiliza diversos repositórios ou use cases, isso dificulta o debugging da aplicação, pois blocos try-catch podem desviar o fluxo de execução de forma semelhante a um "goto", dificultando o acompanhamento da lógica sequencial que um computador executa linha por linha. Para resolver esse problema, foi implementado o Result Pattern, que encapsula o sucesso e o erro em classes distintas, assim o desenvolvedor é forçado a tratar os dois casos, evitando erros não tratados e melhorando a legibilidade do código.

Aqui está um trecho exemplo do Result Pattern sendo utilizado em um repositório:

```dart
    try {
      final Result<DeviceInfoLocalModel> res = await _localDatasource
          .getPlataformVersion();

      switch (res) {
        case Ok<DeviceInfoLocalModel>():
          return Result<DeviceInfo>.ok(
            DeviceInfo(osversion: res.value.version),
          );
        case Error<DeviceInfoLocalModel>():
          return Result<DeviceInfo>.error(res.error);
      }
    } on Exception catch (e) {
      return Result<DeviceInfo>.error(e);
    }
```

O datasource tem uma única responsabilidade que é obter dados, por isso, caso haja algum erro, ele deve ser convertido para o Result.error. Assim, fica mais fácil tratar em camadas superiores ou mesmo no repositório.

```dart
  Future<Result<DeviceInfoLocalModel>> getPlataformVersion() async {
    try {
      final String version = await _channel.invokeMethod('getPlataformVersion');
      return Result<DeviceInfoLocalModel>.ok(
        DeviceInfoLocalModel(version: version),
      );
    } on PlatformException catch (e) {
      return Result<DeviceInfoLocalModel>.error(e);
    }
  }
```


### Depender de abstrações e não de implementações

Esse é um dos princípios do SOLID (D de Dependency Inversion Principle). Ele diz que módulos de alto nível não devem depender de módulos de baixo nível, ambos devem depender de abstrações. No projeto, isso é aplicado na camada de presentation, onde os repositórios nos BLoCs são dependentes das abstrações.



### Injeção de Dependência

A injeção de dependência é feita utilizando o pacote GetIt, que é um locator. Ele permite registrar e resolver dependências de forma simples e eficiente. A configuração das dependências é feita no arquivo `locator.dart`, onde todas as classes são registradas.

No projeto, todas são inicializadas com registerLazySingleton, que cria a instância somente quando ela é necessária e, uma vez criada, é reutilizada. Isso permite salvar em memória os dados já obtidos, evitando chamadas desnecessárias, como no exemplo abaixo, onde salvamos a lista de places na memória volátil.

```dart
  List<Place>? _cachedPlaces;

  @override
  Future<Result<List<Place>>> getPlaces() async {
    if (_cachedPlaces != null) {
      return Result<List<Place>>.ok(_cachedPlaces!);
    }
    
    final Result<List<PlaceLocalModel>> result = await _localDatasource.getLocalPlaces();
    //...
    _cachedPlaces = // list of places
    //...
  }
```

Essa abordagem é muito útil em chamadas que podem ser custosas ou naquelas em que os dados têm pouca variação.

### Quebrando a arquitetura: o uso de ChangeNotifier nas rotas

O uso do ChangeNotifier nas rotas foi uma tentativa de separar a lógica de navegação da lógica de negócio (BLoCs), mas não foi uma estratégia muito boa e precisa ser reavaliada, pois, do jeito atual, ela é bastante verbosa, dificultando a manutenção do código e a escalabilidade do projeto.

- Possíveis soluções:
  - Utilizar o bloc para gerenciar o estado e reduzir o boilerplate code com o uso do `@freezed`.
  - Usar um pacote que facilite a navegação declarativa como o GoRouter.
  - Usar o `MaterialApp.router(routerConfig: )`, que é mais simples e direto.

### Analyzer e Lint

O projeto utiliza o `flutter_lints` para garantir a qualidade do código, seguindo boas práticas e padrões recomendados pela comunidade Flutter. Além disso, o `bloc_lint` é usado para garantir que os blocs sigam as melhores práticas específicas do padrão BLoC.

Isso facilita a manutenção e padronização do código, além de ajudar a evitar erros comuns. Rodando o comando `flutter analyze` é possível verificar problemas.

Todas as configurações foram baseadas em boas práticas recomendadas pela comunidade Flutter e BLoC.

### Arquitetura Limpa (Clean Architecture)

O projeto é estruturado seguindo os princípios do SOLID da Arquitetura Limpa. A estrutura do projeto é dividida em camadas distintas:

#### Organização das Pastas

| Pasta | Descrição |
|-------|-----------|
📦 **flutter_challenge** — Raiz do projeto  
┣ 📂 android — Arquivos de configuração específicos para Android  
┣ 📂 ios — Arquivos de configuração específicos para iOS  
┣ 📂 lib — **Código fonte principal da aplicação**  
┃ ┣ 📂 **data** — Camada de Dados: Comunicação com fontes externas  
┃ ┃ ┣ 📂 datasources — Comunicação com fontes de dados  
┃ ┃ ┗ 📂 model — DTOs (Data Transfer Objects)  
┃ ┣ 📂 **domain** — Camada de Domínio: Regras de negócio da aplicação  
┃ ┃ ┣ 📂 model — Entidades de domínio
┃ ┃ ┗ 📂 repository — Interfaces e Implementações dos repositórios  
┃ ┣ 📂 **presentation** — UI e lógica de UI (BLoCs)  
┃ ┃ ┗ 📂 features — 
┃ ┃    *Cada feature contém:*  
┃ ┃    ┣ 📂 bloc(opcional) — Gerenciamento de estado (BLoC pattern)  
┃ ┃    ┣ 📂 pages — Páginas (telas) da feature  
┃ ┃    ┗ 📂 widgets(opcional) — Componentes reutilizáveis da feature  
┃ ┣ 📂 **utils** — Arquivos utilitários e widgets globais  
┃ ┃ ┣ 📂 routes — Configuração de rotas da aplicação.
┃ ┃ ┣ 📂 widgets — Widgets globais reutilizáveis.
┃ ┃ ┣ 📄 helper_functions.dart — Funções auxiliares  
┃ ┃ ┗ 📄 result.dart — Classes para tratamento de sucesso/erro. 
┃ ┣ 📄 locator.dart — Configuração da injeção de dependência (GetIt)  
┃ ┗ 📄 main.dart — Ponto de entrada da aplicação.  
┣ 📂 macos — Arquivos de configuração específicos para macOS  
┣ 📂 linux — Arquivos de configuração específicos para Linux  
┣ 📂 windows — Arquivos de configuração específicos para Windows  
┗ 📂 web — Arquivos de configuração específicos para Web  


## Pacotes usados

### Dependências:
Dependências necessárias para o funcionamento da aplicação.

- `flutter_bloc`, `bloc`: dependências principais para o gerenciamento de estado usando o padrão BLoC.
- `equatable`: dependência que facilita a comparação de objetos, muito útil em estados e eventos do BLoC.
- `cached_network_image`: para carregar e cachear imagens de rede de forma eficiente.
- `get_it`: para injeção de dependência e service locator.
- `json_annotation`, `freezed_annotation`: dependências necessárias para utilização do código gerado pelo freezed e json_serializable.
- `meta`: para anotações de metadados.

### Dependências de desenvolvimento:

Dependências usadas apenas durante o desenvolvimento, ou seja, não há a necessidade de adicioná-las nas dependências normais.

- `bloc_lint` e `flutter_lints`: para garantir a qualidade do código e seguir boas práticas.
- `build_runner`, `freezed` e `json_serializable`: para geração de código.

## Desafios encontrados e soluções

## Funcionalidades:

### 1. Home

Para cada funcionalidade foi criado um simples card, pegando algumas imagens de lugares famosos ao redor do mundo em imagens gratuitas do Google, para trazer um aspecto visual melhor do que apenas o nome de cada página.

Fonte: própria

### 2. CustomPainter Screen

Para a tela de CustomPainter, foi criado o logo da empresa For People Software utilizando o CustomPainter. Para fugir um pouco do óbvio, juntei com uma simples animação que faz o logo girar utilizando o AnimationController. 

Além disso, também inseri o RepaintBoundary para melhorar a performance, evitando que o CustomPainter seja redesenhado desnecessariamente.

### 3. Router 2.0 Screen

Representa uma tela simples explicando o conceito de Router 2.0.

### 4. Bloc Screen

Uma tela simples que incrementa e decrementa um contador utilizando o padrão BLoC.

### 5. Platform Channels Screen

Uma página simples que exibe a versão do sistema operacional do dispositivo, obtida através de Platform Channels.
Foi realizado código tanto para Android quanto para iOS, utilizando MethodChannel para comunicação entre o código Dart e o código nativo.

### 6. Performance Screen

Nessa página foi criado um exemplo simples de uma lista grande, onde cada item é um widget complexo que consome muitos recursos para ser renderizado. Para melhorar a performance, utilizei o `RepaintBoundary`, para isolar cada item da lista e evitar que toda a lista seja redesenhada desnecessariamente quando um item é atualizado ou interagido. Também reutilizei o componente do bloc Counter o mais alto possível na widget tree para verificar se os itens da lista não são redesenhados desnecessariamente quando o contador é alterado.

### 7. Isolate Screen

Nessa página foi criado um exemplo simples de uso de Isolate com a função `compute` para realizar uma tarefa custosa em segundo plano, sem bloquear a interface do usuário. A tarefa escolhida foi o cálculo de números primos, que pode ser demorado dependendo do intervalo escolhido. O resultado é exibido na tela após a conclusão do cálculo. Existem dois botões: um para calcular os primos na main isolate e outro para calcular em um isolate separado. Assim, é possível ver a diferença de performance entre os dois e como faz diferença utilizar isolates.

### 8. AnimationController Screen

Nessa página quis fazer algo um pouco diferente, então reutilizei a informação da imagem do próprio card da home e criei uma animação simples que aumenta e diminui o tamanho da imagem utilizando o AnimationController. Nela é possível pausar, aumentar, diminuir e acompanhar os estados da animação.

### 9. StreamBuilder Screen

Nessa página foi criado um exemplo simples de uso do StreamBuilder para exibir dados que mudam ao longo do tempo. Foi criado um StreamController que emite valores inteiros a cada segundo, simulando dados sendo recebidos. O StreamBuilder escuta esse stream e atualiza a interface do usuário sempre que um novo valor é emitido, exibindo o valor atual na tela. Para isso, há 20% de chance de ocorrer um erro. Sempre que isso acontece, o erro é exibido na tela.

### 10. Slivers Screen

Nessa página foi criado um exemplo simples de uso de Slivers para criar uma interface de usuário que pode ser rolada de forma eficiente. A tela contém um CustomScrollView que inclui um SliverAppBar, que é uma barra de aplicativo que pode ser expandida e recolhida conforme o usuário rola a tela. Abaixo da SliverAppBar, há um SliverList que exibe uma lista de itens. Cada item da lista é um Card contendo uma imagem e um título, representando diferentes lugares ao redor do mundo. A utilização de Slivers permite uma experiência de rolagem suave e eficiente, especialmente em listas longas ou com muitos elementos visuais e adaptáveis.

## O que poderia ser melhorado

- Testes unitários e de widget para garantir a qualidade do código.
- Utilização de abstração dos datasources. Normalmente, em aplicações maiores, existem datasources local e de API que implementam a mesma interface. Os dados são obtidos através da chamada à API ou podem ser chamados localmente, como em um SharedPreferences ou um SQLite. Tendo a mesma interface, fica fácil a comunicação pelo repositório, fazendo com que ele dependa de abstrações e não de implementações.

## Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) instalado
- [Dart](https://dart.dev/get-dart) instalado
- [FVM](https://fvm.app/) instalado (opcional, mas recomendado)

## Instalação

- clone este repositório e instale as dependências:

    ```bash
        git clone https://github.com/Arthurlima544/flutter_challenge.git
    ```

- instale a vesão que foi utilizada para o desenvolvimento do projeto (mais recente):

    ```bash
        fvm install 3.35.1 
        fvm use 3.35.1 
    ```

- instale as dependências do projeto:

    ```bash
        flutter pub get
    ```

- execute o projeto:

    ```bash
        flutter run
    ```

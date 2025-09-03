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
- [Arquitetura do Projeto](#arquitetura-do-projeto)
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


## Arquitetura do Projeto

A ideia principal dessa arquitetura é trazer elementos de arquiteturas consagradas como [Clean Architecture](https://en.wikipedia.org/wiki/Clean_Architecture), incrementados com a própria recomendação do time do Flutter/Dart de [Arquitetura Proposta](https://docs.flutter.dev/app-architecture/guide), em um projeto simples em seu começo porém com a facilidade de se tornar escalável.

<!-- IMAGE HERE -->

A ideia como na figura acima é dividir a aplicação em 3 camadas, onde camada internas da aplicação não dependem de camadas externas [DIP](https://en.wikipedia.org/wiki/Dependency_inversion_principle), e a comunicação entre as camadas seja feita por meio de abstrações (pelo menos nas partes mais críticas como o repository).

<!-- IMAGE HERE -->

Essa Figura acima ilustra como as camadas se comunicam entre si, e como o [fluxo unidirecional de dados](https://en.wikipedia.org/wiki/Unidirectional_data_flow) acontece, promovendo previsibilidade do software.

### Organização de pastas


| Pasta | Descrição |
|-------|-----------|
📦 **flutter_challenge** — Raiz do projeto  
┣ 📂 android — Arquivos de configuração específicos para Android  
┣ 📂 ios — Arquivos de configuração específicos para iOS  
┣ 📂 lib — **Código fonte principal da aplicação**  
┃ ┣ 📂 **data** — Camada de Dados: Comunicação com fontes externas e SST. 
┃ ┃ ┣ 📂 services — Comunicação com fontes de dados  
┃ ┃ ┣ 📂 exceptions — Exceções únicas da camada de dados
┃ ┃ ┗ 📂 repository - Single Source of Truth.
┃ ┣ 📂 **domain** — Camada de Domínio: Regras de negócio da aplicação e Interfaces 
┃ ┃ ┣ 📂 entity — Entidades de domínio  
┃ ┃ ┗ 📂 repository — Interfaces dos repositórios  
┃ ┣ 📂 **presentation** — UI e lógica de UI (BLoCs)  
┃ ┃ ┣ 📂 bloc — Gerenciamento de estado (BLoC pattern)  
┃ ┃ ┗ 📂 pages — Páginas (telas) da feature  
┃ ┃   ┗ 📂 widgets — Componentes reutilizáveis da feature  
┃ ┣ 📂 **utils** — Arquivos utilitários e widgets globais  
┃ ┃ ┣ 📂 routes — Configuração de rotas da aplicação.
┃ ┃ ┣ 📂 widgets — Widgets globais reutilizáveis.
┃ ┃ ┣ 📄 app_exception.dart — Exceções gerais.
┃ ┃ ┣ 📄 helper_functions.dart — Funções auxiliares  
┃ ┃ ┗ 📄 result.dart — Classes para tratamento de sucesso/erro. 
┃ ┣ 📄 locator.dart — Configuração da injeção de dependência (GetIt)  
┃ ┗ 📄 main.dart — Ponto de entrada da aplicação.  
┣ 📂 macos — Arquivos de configuração específicos para macOS  
┣ 📂 linux — Arquivos de configuração específicos para Linux  
┣ 📂 windows — Arquivos de configuração específicos para Windows  
┗ 📂 web — Arquivos de configuração específicos para Web  

### Domain

#### Entity

- **Visão geral**: Entidades representam objetos imutáveis responsáveis por transformar dados vindos de diferentes fontes (ex.: fromJson) e manter o domínio da aplicação de forma segura e previsível.

---

- **Responsabilidade**: Representar objetos imutáveis e transformar dados de diferentes fontes de dados (ex: fromJson).
  - Representar objetos imutáveis do domínio.
  - Transformar dados de diferentes fontes (por exemplo fromJson).
  - Criar novas instâncias sem mutação direta (imutabilidade).

---

- **Vantagens**:
  - Reduz problemas de [race condition](https://en.wikipedia.org/wiki/Race_condition), [data inconsistency](https://en.wikipedia.org/wiki/Data_consistency#Application_consistency) e [sincronização](https://en.wikipedia.org/wiki/Synchronization_(computer_science)).
  - Facilita produzir código rapidamente.
  - É muito comum requisitos de software mudarem, um novo campo ser adicionado ou removido. Manter a classe imutável e delegar a responsabilidade de criar novas instâncias para o `freezed` ajuda a evitar bugs e problemas de manutenção.
  - Com a imutabilidade fica fácil de implementar do conceito de [Memoization](https://en.wikipedia.org/wiki/Memoization), otimizando chamadas repetidas.

---

- **freezed** e **sealed classes**:
  - O uso de **sealed classes** (ex.: [sealed classes no Dart](https://dart.dev/language/class-modifiers#sealed)) com `freezed`:
    - Ajuda a evitar erros de herança indesejados.
    - Traz **exhaustiveness checking** em `switch`, reduzindo o comum esquecimento de algum caso a ser tratado. (ver: [exhaustiveness checking](https://dart.dev/language/branches#exhaustiveness-checking))

---

- **Union Types**
  - Usar **Union Types** (tipos de união) permite declarar diferentes variantes de um mesmo conceito que compartilham interface, mas têm atributos diferentes.
  - Isso é útil onde casos distintos precisam ser tratados de forma explícita usando uma factory diferente da padrão (Também é útil para os estados do BLoC).

---

- **Entidades do Projeto**:
  - **DeviceInfoEntity**: Representa informações do dispositivo (versão do OS).
  - **PlaceEntity**: Representa locais/lugares com tipo, imagem e título.

---

- **Possíveis problemas e observações**
  - Em projetos maiores, usar pacotes geradores de código como `freezed` e `json_serializable` pode:
    - Aumentar o tempo de *build* (por consequência diminuir a produtividade do desenvolvedor).
    - Causar conflitos de versão entre dependências.
    - Travar o desenvolvedor em um erro desconhecido (principalmente para aqueles sem tanta experiencia com esses packages).
  - Esses problemas tendem a aparecer conforme o projeto escala; uma alternativa possível é usar **data classes**(Em desenvolvimento pelo time de dart - atualmente dia 03/09/2025) no Dart quando apropriado.

---

- **Links Úteis**:
  - Issue ativa mais votada do Dart sobre Data Classes: https://github.com/dart-lang/language/issues/314  
  - Cancelamento das Macros (Dart Team): https://medium.com/dartlang/an-update-on-dart-macros-data-serialization-06d3037d4f12
  - [Immutable Object](https://en.wikipedia.org/wiki/Immutable_object) - Definição e vantagens da imutabilidade
  - [Builder Pattern](https://en.wikipedia.org/wiki/Builder_pattern) - Padrão para construção de objetos complexos.

#### Repository

- **Visão geral**: Na camada de domínio repositórios definem contratos abstratos para acesso a dados.

---

- **Responsabilidade**:
  - Definir [interfaces abstratas](https://en.wikipedia.org/wiki/Interface_(computing)) para operações de dados.
  - Promover [inversão de dependência](https://en.wikipedia.org/wiki/Dependency_inversion_principle) entre camadas.

---

- **Vantagens**:
  - Facilitar[mocks e stubs](https://en.wikipedia.org/wiki/Mock_object).
  - Abstrai detalhes de implementação de fontes de dados.
  - **Manutenibilidade**: Mudanças na fonte de dados não afetam o domínio.

---

- **Padrão Result**:
  - Uso do `result_dart` para [tratamento de erros funcionais](https://en.wikipedia.org/wiki/Functional_programming#Pure_functions).
  - Evita exceptions não tratadas.
  - Força tratamento explícito de casos de erro.
  - Melhora a previsibilidade do código através de [monads](https://en.wikipedia.org/wiki/Monad_(functional_programming))(flatmap).

---

### Data

#### Service

- **Visão geral**: Services responsáveis por encapsular lógica de acesso a dados, abstraindo detalhes técnicos.

---

- **Responsabilidade**: 
  - Encapsular operações de baixo nível para acesso a dados.
  - Transformar dados brutos em entidades de domínio.
  - Capturar o Erro porém não tratar

---

- **Vantagens**:
  - Services podem ser utilizados por múltiplos repositórios (N:N).
  - Cada service tem uma função específica ([Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)).
  - Isolamento de lógica de acesso a dados.

---

- **Tratamento de Erros**:
  - Uso de exceptions customizadas específicas para cada tipo de erro.
  - Transformação de erros de baixo nível em erros de domínio.
  - Logging para debugging.

---

- **Possíveis problemas e observações**:
  - Services muito genéricos podem violar o [princípio da responsabilidade única](https://en.wikipedia.org/wiki/Single-responsibility_principle).
  - Excesso de abstração pode tornar o código mais complexo que necessário.
  - Importante balancear entre reutilização e simplicidade.

#### Repository Implementation

- **Visão geral**: Implementações concretas dos contratos definidos na camada de domínio, com o principal objetivo de ser um [Single Source Of Truth](https://en.wikipedia.org/wiki/Single_source_of_truth).

---

- **Responsabilidade**: Implementar os contratos de repositório definidos no domínio.
  - Orquestrar múltiplos services quando necessário.
  - Implementar lógicas de cache e otimização.
  - Transformar dados de services em entidades de domínio.
  - Tratar e mapear erros específicos.

---

- **Vantagens**:
  - **Controle fino**: Implementação específica para cada necessidade.
  - **Otimização**: Cache, [memoização](https://en.wikipedia.org/wiki/Memoization), strategies de retry.
  - **Flexibilidade**: Diferentes implementações para diferentes contextos.
  - **Evolução**: Facilita migração entre fontes de dados.

---

- **Estratégias de Cache**:
  - Cache em memória para dados frequentemente acessados.
  - Invalidação inteligente baseada em tempo ou eventos.
  - Fallback para cache quando rede não está disponível ([Cache-aside pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/cache-aside)).

---

- **Possíveis problemas e observações**:
  - Cache pode introduzir problemas de [consistência de dados](https://en.wikipedia.org/wiki/Data_consistency), que é resolvido pela camada de Entidades.
  - Lógica complexa de orquestração pode indicar responsabilidades mal definidas. 

### Presentation

#### State Management (Blocs)

- **Visão geral**: [BLoC](https://bloclibrary.dev/) (Business Logic Component) gerencia estados da interface de usuário de forma reativa, separando a lógica da interface.

---

- **Responsabilidade**: Gerenciar estados e lógica de apresentação.
  - Receber eventos da interface de usuário.
  - Executar lógica de negócio através de repositórios.
  - Emitir novos estados baseados em resultados.
  - Manter histórico de estados para debugging.

---

- **Vantagens**:
  - Lógica isolada e testável independentemente da UI.

---

- **freezed para Events e States**:
  - [Union types](https://medium.com/@aliammariraq/sealed-classes-in-dart-unlocking-powerful-features-d8dba185925f) para diferentes tipos de eventos e estados.
  - Imutabilidade garantida.
  - [Tratamento exaustivo](https://dart.dev/language/branches#exhaustiveness-checking).

---

- **Links Úteis**:
  - [Reactive Programming](https://en.wikipedia.org/wiki/Reactive_programming) - Paradigma de programação reativa.

---

- **Possíveis problemas e observações**:
  - BLoCs muito complexos podem indicar responsabilidades mal distribuídas.
  - Estados com muitos campos podem ser difíceis de gerenciar.
  - Importante balancear granularidade de eventos e estados.
  - Caso um bloc fique muito grande vale a pena avaliar sua responsabilidade e dividir em menores.
  - Caso um bloc comece a utilizar muitos repositórios, talvez seja o momento de criar uma camada de UseCases para abstrair essa lógica.

#### Screens

- **Visão geral**: Screens representam páginas completas da aplicação, sendo responsáveis por compor widgets e conectar com BLoCs para gerenciamento de estado.

---

- **Responsabilidade**: Compor interface de usuário e conectar com lógica de estado.
  - Definir estrutura visual das páginas.
  - Conectar com BLoCs.
  - Orquestrar widgets menores para formar a página completa.
 
---

- **Vantagens**:
  - **Organização**: [Separação de responsabilidades](https://en.wikipedia.org/wiki/Separation_of_concerns) entre diferentes funcionalidades.
  - **Reutilização**: Widgets podem ser reutilizados entre screens.
  - **Manutenibilidade**: Mudanças em uma screen não afetam outras.
---

- **Links Úteis**:
  - [Material Design](https://material.io/design) - Guidelines de design do Google

---

- **Possíveis problemas e observações**:
  - Screens muito grandes podem ser difíceis de manter ([God Object antipattern](https://en.wikipedia.org/wiki/God_object)).
  - Importante extrair widgets reutilizáveis quando apropriado.
  - Evitar lógica de negócio diretamente nas screens.

#### Widgets

- **Visão geral**: Widgets são componentes reutilizáveis, responsáveis por encapsular funcionalidades visuais específicas e promover reutilização de código.

---

- **Responsabilidade**: Encapsular componentes visuais reutilizáveis.
  - Implementar elementos visuais específicos.
  - Encapsular lógica de apresentação simples.
  - Promover reutilização.
  - Manter [consistência visual](https://en.wikipedia.org/wiki/Design_system) da aplicação.

---

- **Vantagens**:
  - **Reutilização**: Mesmo componente usado em múltiplas telas ([DRY Principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)).

---

- **Tipos de Widgets**:
  - **Widgets Globais**: Componentes usados em toda aplicação.
  - **Widgets Específicos**: Componentes únicos de uma funcionalidade.
  - **Widgets de Layout**: Organização e estruturação visual ([Layout Management](https://en.wikipedia.org/wiki/Layout_manager)).

---

- **Links Úteis**:
  - [Design Systems](https://en.wikipedia.org/wiki/Design_system) - Sistemas de design para consistência

---

- **Possíveis problemas e observações**:
  - Widgets muito genéricos podem ser difíceis de usar.
  - Excesso de parâmetros pode indicar responsabilidades mal definidas.
  - Importante balancear entre flexibilidade e simplicidade.

### Locator
    
- **Visão geral**: O Locator é responsável por gerenciar a injeção de dependências na aplicação, facilitando a criação e o fornecimento de instâncias de classes necessárias em diferentes partes do código.

- **Responsabilidade**:
  - Gerenciar o ciclo de vida das dependências.
  - Fornecer instâncias configuradas para diferentes contextos.
  - Facilitar a troca de implementações (ex.: para testes).
  - Promover [Inversão de Controle](https://en.wikipedia.org/wiki/Inversion_of_control).

- **Vantagens**:
  - **Desacoplamento**: Reduz dependências diretas entre classes.
  - [Lazy Loading](https://en.wikipedia.org/wiki/Lazy_loading) - Carregamento sob demanda de dependências.


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

<img width="369" height="830" alt="Captura de ecrã 2025-08-24, às 10 57 06" src="https://github.com/user-attachments/assets/5b8ff2d5-26f1-492c-bbd1-47abb5c48049" />

Fonte: própria

### 2. CustomPainter Screen

Para a tela de CustomPainter, foi criado o logo da empresa For People Software utilizando o CustomPainter. Para fugir um pouco do óbvio, juntei com uma simples animação que faz o logo girar utilizando o AnimationController. 


https://github.com/user-attachments/assets/46a93031-992a-4b71-ac25-7d7c6ee6f3ad


Além disso, também inseri o RepaintBoundary para melhorar a performance, evitando que o CustomPainter seja redesenhado desnecessariamente.

### 3. Router 2.0 Screen

Representa uma tela simples explicando o conceito de Router 2.0.


https://github.com/user-attachments/assets/5767745f-a2e9-408d-8d48-a6e188fe30e6



### 4. Bloc Screen

Uma tela simples que incrementa e decrementa um contador utilizando o padrão BLoC.



https://github.com/user-attachments/assets/f665520f-821c-4cb4-bad5-31e2faa93e70



### 5. Platform Channels Screen

Uma página simples que exibe a versão do sistema operacional do dispositivo, obtida através de Platform Channels.
Foi realizado código tanto para Android quanto para iOS, utilizando MethodChannel para comunicação entre o código Dart e o código nativo.


https://github.com/user-attachments/assets/463b3519-1afd-4ead-a8f8-531da8585b83


### 6. Performance Screen

Nessa página foi criado um exemplo simples de uma lista grande, onde cada item é um widget complexo que consome muitos recursos para ser renderizado. Para melhorar a performance, utilizei o `RepaintBoundary`, para isolar cada item da lista e evitar que toda a lista seja redesenhada desnecessariamente quando um item é atualizado ou interagido. Também reutilizei o componente do bloc Counter o mais alto possível na widget tree para verificar se os itens da lista não são redesenhados desnecessariamente quando o contador é alterado.



Uploading Gravação do ecrã 2025-08-24, às 11.08.20.mov…


### 7. Isolate Screen

Nessa página foi criado um exemplo simples de uso de Isolate com a função `compute` para realizar uma tarefa custosa em segundo plano, sem bloquear a interface do usuário. A tarefa escolhida foi o cálculo de números primos, que pode ser demorado dependendo do intervalo escolhido. O resultado é exibido na tela após a conclusão do cálculo. Existem dois botões: um para calcular os primos na main isolate e outro para calcular em um isolate separado. Assim, é possível ver a diferença de performance entre os dois e como faz diferença utilizar isolates.




https://github.com/user-attachments/assets/0ff465c2-1fb1-440e-b47b-8e14a77c3b43



### 8. AnimationController Screen

Nessa página quis fazer algo um pouco diferente, então reutilizei a informação da imagem do próprio card da home e criei uma animação simples que aumenta e diminui o tamanho da imagem utilizando o AnimationController. Nela é possível pausar, aumentar, diminuir e acompanhar os estados da animação.



https://github.com/user-attachments/assets/da6607bf-6b04-484f-8623-05672d760267



### 9. StreamBuilder Screen

Nessa página foi criado um exemplo simples de uso do StreamBuilder para exibir dados que mudam ao longo do tempo. Foi criado um StreamController que emite valores inteiros a cada segundo, simulando dados sendo recebidos. O StreamBuilder escuta esse stream e atualiza a interface do usuário sempre que um novo valor é emitido, exibindo o valor atual na tela. Para isso, há 20% de chance de ocorrer um erro. Sempre que isso acontece, o erro é exibido na tela.




https://github.com/user-attachments/assets/c1d97a94-db27-494f-86b0-6a63c847475b


### 10. Slivers Screen

Nessa página foi criado um exemplo simples de uso de Slivers para criar uma interface de usuário que pode ser rolada de forma eficiente. A tela contém um CustomScrollView que inclui um SliverAppBar, que é uma barra de aplicativo que pode ser expandida e recolhida conforme o usuário rola a tela. Abaixo da SliverAppBar, há um SliverList que exibe uma lista de itens. Cada item da lista é um Card contendo uma imagem e um título, representando diferentes lugares ao redor do mundo. A utilização de Slivers permite uma experiência de rolagem suave e eficiente, especialmente em listas longas ou com muitos elementos visuais e adaptáveis.


https://github.com/user-attachments/assets/14cb3790-bb8a-44d1-9af8-c8f246dea6b7


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

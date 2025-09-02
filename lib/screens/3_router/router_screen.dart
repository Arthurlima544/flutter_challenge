import 'package:flutter/material.dart';

import '../../../utils/widgets/default_appbar.dart';
import 'widgets/section_title.dart';
import 'widgets/step_widget.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const DefaultAppbar(titleText: 'Router Page'),
    body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        Divider(height: 40),
        SectionTitle(
          title: 'Exemplo passo a passo de navegação',
          subtitle:
              'O que acontece quando aperto o item "CustomPainter Basics":',
        ),
        StepWidget(
          number: '1',
          title: 'Toque do Usuário',
          description:
              'O usuário toca no item. O callback `onTap` fornecido por `mapOnTapByPlaceTitle` é acionado.',
        ),
        StepWidget(
          number: '2',
          title: 'Chamar Método do Delegate',
          description:
              'O callback encontra o `SkillPlaygroundRouterDelegate` e chama seu método `goToCustomPainterPage()`.',
        ),
        StepWidget(
          number: '3',
          title: 'Atualizar Estado',
          description:
              'O método `goToCustomPainterPage()` atualiza a variável de estado interna `_currentConfig` para uma nova configuração onde `selectedRoute` é "/custom_painter".',
        ),
        StepWidget(
          number: '4',
          title: 'Notificar "Listeners"',
          description:
              'De forma crucial, o método `notifyListeners()` é chamado. Isso transmite para a aplicação que o estado da navegação mudou.',
        ),
        StepWidget(
          number: '5',
          title: 'Reconstruir a UI',
          description:
              'O Flutter "ouve" a notificação e chama o método `build()` do seu `RouterDelegate` novamente.',
        ),
        StepWidget(
          number: '6',
          title: 'Exibir Nova Página',
          description:
              'Dentro do `build()`, a declaração `switch` verifica o novo valor de `_currentConfig.selectedRoute`. Ele agora corresponde ao caso \'/custom_painter\' e retorna uma `MaterialPage` contendo sua `CustomPainterPage`. A UI é atualizada para mostrar a nova tela.',
        ),

        Divider(height: 40),
      ],
    ),
  );
}

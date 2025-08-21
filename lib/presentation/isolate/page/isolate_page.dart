import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';
import '../../custom_painter/widget/custom_painting_logo.dart';
import '../bloc/isolate_bloc.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  final TextEditingController _controller = TextEditingController(
    text: '999999937',
  );

  void _submit(bool isWithCompute) {
    final int? number = int.tryParse(_controller.text);
    if (number != null) {
      context.read<IsolateBloc>().add(
        IsolateEvent.isPrime(isWithCompute: isWithCompute, number: number),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[50],
    appBar: AppBar(
      leading: BackButton(
        onPressed: () {
          (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
              .goHome();
        },
      ),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const RepaintBoundary(child: CustomPaintingLogo()),
          const SizedBox(height: 32),
          const Text(
            'Teste com Isolates',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(height: 8),
          Text(
            'Insira um número para verificar se é primo, usando ou não um Isolate para o cálculo.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  _buildNumberTextField(),
                  const SizedBox(height: 20),
                  SizedBox(
                    key: ValueKey<IsolateState>(
                      context.watch<IsolateBloc>().state,
                    ),
                    height: 40,
                    child: BlocBuilder<IsolateBloc, IsolateState>(
                      builder: (BuildContext context, IsolateState state) =>
                          state.when(
                            initial: () => Text(
                              'Aguardando enviar um número...',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            success: (bool isPrime) => Chip(
                              avatar: Icon(
                                isPrime ? Icons.check_circle : Icons.cancel,
                                color: Colors.white,
                              ),
                              label: Text(
                                isPrime ? 'É Primo!' : 'Não é Primo',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: isPrime
                                  ? Colors.green
                                  : Colors.redAccent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlinedButton.icon(
                icon: const Icon(Icons.computer),
                label: const Text('Verificar (com compute)'),
                onPressed: () => _submit(true),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade800,
                  side: BorderSide(color: Colors.blue.shade800),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.error_outline_rounded),
                label: const Text('Verificar (sem compute)'),
                onPressed: () => _submit(false),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade800,
                  side: BorderSide(color: Colors.red.shade800),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _buildNumberTextField() => TextField(
    controller: _controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      hintText: 'Digite um número',
      prefixIcon: const Icon(Icons.numbers),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    ),
  );
}

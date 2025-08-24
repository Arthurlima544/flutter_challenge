import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utils/widgets/default_appbar.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  late final StreamController<int> _controller;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = StreamController<int>();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      final int rand = Random().nextInt(99) + 1;
      if (rand > 80) {
        _controller.addError('Fake error: 20% chance to occur');
      } else {
        _controller.add(rand);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const DefaultAppbar(titleText: 'Stream Builder Page'),
    body: Center(
      child: Column(
        children: <Widget>[
          const Spacer(),
          StreamBuilder<int>(
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(Icons.warning, color: Colors.red, size: 24),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SizedBox(
                        width: 200,
                        height: 30,
                        child: Text(
                          snapshot.error as String,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData) {
                return const Text('Not data Yet');
              }
              return Column(
                children: <Widget>[
                  const Text('O numero atual é: '),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          snapshot.data!.toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            stream: _controller.stream,
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}

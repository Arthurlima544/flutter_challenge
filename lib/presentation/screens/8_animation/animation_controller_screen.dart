import 'package:flutter/material.dart';

import '../../../../utils/widgets/default_appbar.dart';

enum AnimationSimpleState { notStated, paused, moving, completed }

TextSpan mapAnimationSimpleStateToTextWidget(AnimationSimpleState state) {
  switch (state) {
    case AnimationSimpleState.notStated:
      return const TextSpan(
        text: 'Não Iniciado',
        style: TextStyle(color: Colors.red),
      );
    case AnimationSimpleState.paused:
      return const TextSpan(
        text: 'Pausado',
        style: TextStyle(color: Colors.blue),
      );
    case AnimationSimpleState.moving:
      return const TextSpan(
        text: 'Movendo',
        style: TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
      );
    case AnimationSimpleState.completed:
      return const TextSpan(
        text: 'Completo',
        style: TextStyle(color: Colors.green),
      );
  }
}

class PhotoCard extends StatelessWidget {
  const PhotoCard({required this.imageUrl, super.key, this.ontap});

  final String imageUrl;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: ontap,
      child: ClipRRect(child: Image.network(imageUrl, fit: BoxFit.fill)),
    ),
  );
}

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  State<AnimationControllerScreen> createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation =
        Tween<double>(begin: 100, end: 300).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        )..addListener(() {
          setState(() {});
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AnimationSimpleState currentState;
    if (_animationController.isAnimating) {
      currentState = AnimationSimpleState.moving;
    } else {
      if (_animationController.value == 0.0) {
        currentState = AnimationSimpleState.notStated;
      } else if (_animationController.value == 1.0) {
        currentState = AnimationSimpleState.completed;
      } else {
        currentState = AnimationSimpleState.paused;
      }
    }

    return Scaffold(
      appBar: const DefaultAppbar(titleText: 'Animation Controller Page'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: 'Atual Estado da Animação: ',
                children: <InlineSpan>[
                  mapAnimationSimpleStateToTextWidget(currentState),
                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              height: _animation.value,
              width: _animation.value,
              child: PhotoCard(imageUrl: widget.imageUrl),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _animationController.forward(
                    from: _animationController.value,
                  ),

                  child: const Text('Play'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _animationController.reverse(),
                  child: const Text('Reverse'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    _animationController.stop();
                  },
                  child: const Text('Pause'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

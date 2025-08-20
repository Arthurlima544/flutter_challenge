import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/place/place.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Skill Playground'),
      backgroundColor: Colors.blue,
    ),
    body: BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) => state.when(
        initial: () => const Center(child: Text('Inicializando..')),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (List<Place> places) => GridView.builder(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          itemCount: places.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (BuildContext context, int index) =>
              HomeCard(title: places[index].title, place: places[index]),
        ),
        error: (String message) => Center(child: Text(message)),
      ),
    ),
  );
}



// GridView.count(
//         itemCount: state,
//         crossAxisCount: 2,
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//         crossAxisSpacing: 15,
//         mainAxisSpacing: 15,
//         children: const <Widget>[
//           HomeCard(title: 'CustomPainter Basics'),
//           HomeCard(title: 'Navigator 2.0/ RouterDelegate'),
//           HomeCard(title: 'Bloc State Management'),
//           HomeCard(title: 'Platform Channels'),
//           HomeCard(title: 'Performance & Repaints'),
//           HomeCard(title: 'Async Isolates'),
//           HomeCard(title: 'AnimationController Lifecycle'),
//           HomeCard(title: 'StreamBuilder Error Handling'),
//           HomeCard(title: 'Custom Slivers'),
//         ],
//       ),
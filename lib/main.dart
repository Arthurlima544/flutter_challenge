import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repository/place_repository.dart';
import 'locator.dart';
import 'presentation/home/bloc/home_bloc.dart';
import 'presentation/home/pages/home_page.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      body: Center(
        child: BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(placeRepository: getIt<PlaceRepository>())
                ..add(const HomeEvent.load()),
          child: const Home(),
        ),
      ),
    ),
  );
}

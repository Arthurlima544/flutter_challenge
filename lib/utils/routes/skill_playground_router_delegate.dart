import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/device_info/device_info_repository.dart';
import '../../data/repository/place/place_repository.dart';
import '../../locator.dart';
import '../../presentation/animation_controller/page/animation_controller_page.dart';
import '../../presentation/counter/bloc/counter_bloc.dart';
import '../../presentation/counter/page/counter_page.dart';
import '../../presentation/custom_painter/page/custom_painter_page.dart';
import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/pages/home_page.dart';
import '../../presentation/isolate/bloc/isolate_bloc.dart';
import '../../presentation/isolate/page/isolate_page.dart';
import '../../presentation/navigator/page/navigator_route_page.dart';
import '../../presentation/plataform_channels/bloc/plataform_channels_bloc.dart';
import '../../presentation/plataform_channels/pages/plataform_channels_page.dart';
import '../../presentation/repaint_boundary/page/repaint_boundary_page.dart';
import '../../presentation/slivers/slivers_page.dart';
import '../../presentation/stream_builder/page/stream_builder_page.dart';
import 'skill_playground_router_config.dart';

class SkillPlaygroundRouterDelegate
    extends RouterDelegate<SkillPlaygroundRouterConfig>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SkillPlaygroundRouterConfig> {
  SkillPlaygroundRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  SkillPlaygroundRouterConfig? _currentConfig;

  List<Object?> get arguments => <Object?>[];

  @override
  SkillPlaygroundRouterConfig? get currentConfiguration => _currentConfig;

  @override
  Widget build(BuildContext context) => Navigator(
    key: navigatorKey,
    pages: <Page<dynamic>>[
      switch (_currentConfig?.selectedRoute) {
        '/custom_painter' => MaterialPage<dynamic>(
          key: const ValueKey<String>('CustomPainterPage'),
          child: CustomPainterPage(title: _currentConfig?.selectedItem ?? ''),
        ),
        '/bloc' => MaterialPage<dynamic>(
          key: const ValueKey<String>('BlocStateManagementPage'),
          child: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: const CounterPage(),
          ),
        ),
        '/plataform_channels' => MaterialPage<dynamic>(
          key: const ValueKey<String>('PlataformChannelsPage'),
          child: BlocProvider<PlataformChannelsBloc>(
            create: (BuildContext context) => PlataformChannelsBloc(
              deviceInfoRepository: getIt<DeviceInfoRepository>(),
            )..add(const PlataformChannelsEvent.getPlataformVersion()),
            child: const PlataformChannelsPage(),
          ),
        ),
        '/repaint_boundary' => MaterialPage<dynamic>(
          key: const ValueKey<String>('RepaintBoundaryPage'),
          child: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: const RepaintBoundaryPage(),
          ),
        ),

        '/isolate_page' => MaterialPage<dynamic>(
          key: const ValueKey<String>('IsolatePage'),
          child: BlocProvider<IsolateBloc>(
            create: (BuildContext context) => IsolateBloc(),
            child: const IsolatePage(),
          ),
        ),

        '/animation_controller' => MaterialPage<dynamic>(
          key: const ValueKey<String>('AnimationControllerPage'),
          child: AnimationControllerPage(
            imageUrl: _currentConfig!.arguments[0]! as String,
          ),
        ),

        '/stream_builder_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('StreamBuilderPage'),
          child: StreamBuilderPage(),
        ),

        '/slivers_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('SliversPage'),
          child: SliversPage(),
        ),

        '/navigator_route_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('NavigatorRoutePage'),
          child: NavigatorRoutePage(),
        ),

        _ => MaterialPage<dynamic>(
          key: const ValueKey<String>('HomePage'),
          child: Scaffold(
            body: Center(
              child: BlocProvider<HomeBloc>(
                create: (BuildContext context) =>
                    HomeBloc(placeRepository: getIt<PlaceRepository>())
                      ..add(const HomeEvent.load()),
                child: const Home(),
              ),
            ),
          ),
        ),
      },
    ],
    onDidRemovePage: (Page<Object?> page) {
      if (_currentConfig?.selectedRoute == page.name) {
        _currentConfig = null;
      }
      notifyListeners();
    },
  );

  @override
  Future<void> setNewRoutePath(
    SkillPlaygroundRouterConfig configuration,
  ) async {
    _currentConfig = configuration;
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(SkillPlaygroundRouterConfig configuration) =>
      setNewRoutePath(configuration);

  void goToBlocStateManagementPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(selectedRoute: '/bloc');
    notifyListeners();
  }

  void goHome() {
    _currentConfig = const SkillPlaygroundRouterConfig(selectedRoute: '/');
    notifyListeners();
  }

  void goToCustomPainterPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/custom_painter',
    );
    notifyListeners();
  }

  void goToPlataformChannelsPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/plataform_channels',
    );
    notifyListeners();
  }

  void goToRepaintBoundaryPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/repaint_boundary',
    );
    notifyListeners();
  }

  void goToIsolatePage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/isolate_page',
    );
    notifyListeners();
  }

  void goToAnimationControllerPage(String imageUrl) {
    _currentConfig = SkillPlaygroundRouterConfig(
      selectedRoute: '/animation_controller',
      arguments: <Object?>[imageUrl],
    );
    notifyListeners();
  }

  void goToStreamBuilderPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/stream_builder_page',
    );
    notifyListeners();
  }

  void goToSliversPage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/slivers_page',
    );
    notifyListeners();
  }

  void goToNavigatorRoutePage() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/navigator_route_page',
    );
    notifyListeners();
  }
}

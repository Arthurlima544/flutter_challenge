import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/counter/counter_bloc.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/isolate/isolate_bloc.dart';
import '../../blocs/platform_channels/platform_channels_bloc.dart';
import '../../domain/repository/device_info/device_info_repository.dart';
import '../../domain/repository/place/place_repository.dart';
import '../../locator.dart';
import '../../screens/10_slivers/slivers_screen.dart';
import '../../screens/1_home/home_screen.dart';
import '../../screens/2_custom_painter/custom_painter_screen.dart';
import '../../screens/3_router/router_screen.dart';
import '../../screens/4_bloc/bloc_screen.dart';
import '../../screens/5_platform_channels/platform_channels_screen.dart';
import '../../screens/6_performance/performance_screen.dart';
import '../../screens/7_isolate/isolate_screen.dart';
import '../../screens/8_animation/animation_controller_screen.dart';
import '../../screens/9_stream_builder/stream_builder_screen.dart';
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
          key: const ValueKey<String>('CustomPainterScreen'),
          child: CustomPainterScreen(title: _currentConfig?.selectedItem ?? ''),
        ),
        '/bloc' => MaterialPage<dynamic>(
          key: const ValueKey<String>('BlocStateManagementScreen'),
          child: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: const BlocScreen(),
          ),
        ),
        '/platform_channels' => MaterialPage<dynamic>(
          key: const ValueKey<String>('PlatformChannelsScreen'),
          child: BlocProvider<PlatformChannelsBloc>(
            create: (BuildContext context) => PlatformChannelsBloc(
              deviceInfoRepository: getIt<DeviceInfoRepository>(),
            )..add(const PlatformChannelsEvent.getPlatformVersion()),
            child: const PlatformChannelsScreen(),
          ),
        ),
        '/repaint_boundary' => MaterialPage<dynamic>(
          key: const ValueKey<String>('RepaintBoundaryScreen'),
          child: BlocProvider<CounterBloc>(
            create: (BuildContext context) => CounterBloc(),
            child: const PerformanceScreen(),
          ),
        ),

        '/isolate_page' => MaterialPage<dynamic>(
          key: const ValueKey<String>('IsolateScreen'),
          child: BlocProvider<IsolateBloc>(
            create: (BuildContext context) => IsolateBloc(),
            child: const IsolateScreen(),
          ),
        ),

        '/animation_controller' => MaterialPage<dynamic>(
          key: const ValueKey<String>('AnimationControllerScreen'),
          child: AnimationControllerScreen(
            imageUrl: _currentConfig!.arguments[0]! as String,
          ),
        ),

        '/stream_builder_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('StreamBuilderScreen'),
          child: StreamBuilderScreen(),
        ),

        '/slivers_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('SliversScreen'),
          child: SliversScreen(),
        ),

        '/navigator_route_page' => const MaterialPage<dynamic>(
          key: ValueKey<String>('NavigatorRouteScreen'),
          child: RouterScreen(),
        ),

        _ => MaterialPage<dynamic>(
          key: const ValueKey<String>('HomeScreen'),
          child: Scaffold(
            body: Center(
              child: BlocProvider<HomeBloc>(
                create: (BuildContext context) =>
                    HomeBloc(placeRepository: getIt<PlaceRepository>())
                      ..add(const HomeEvent.load()),
                child: const HomeScreen(),
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

  void goToBlocStateManagementScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(selectedRoute: '/bloc');
    notifyListeners();
  }

  void goHome() {
    _currentConfig = const SkillPlaygroundRouterConfig(selectedRoute: '/');
    notifyListeners();
  }

  void goToCustomPainterScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/custom_painter',
    );
    notifyListeners();
  }

  void goToPlatformChannelsScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/platform_channels',
    );
    notifyListeners();
  }

  void goToRepaintBoundaryScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/repaint_boundary',
    );
    notifyListeners();
  }

  void goToIsolateScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/isolate_page',
    );
    notifyListeners();
  }

  void goToAnimationControllerScreen(String imageUrl) {
    _currentConfig = SkillPlaygroundRouterConfig(
      selectedRoute: '/animation_controller',
      arguments: <Object?>[imageUrl],
    );
    notifyListeners();
  }

  void goToStreamBuilderScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/stream_builder_page',
    );
    notifyListeners();
  }

  void goToSliversScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/slivers_page',
    );
    notifyListeners();
  }

  void goToNavigatorRouteScreen() {
    _currentConfig = const SkillPlaygroundRouterConfig(
      selectedRoute: '/navigator_route_page',
    );
    notifyListeners();
  }
}

import 'package:equatable/equatable.dart';

class SkillPlaygroundRouterConfig extends Equatable {
  const SkillPlaygroundRouterConfig({
    this.id,
    this.selectedItem,
    this.selectedRoute,
    this.isNotFound = false,
  });

  final int? id;
  final String? selectedItem;
  final String? selectedRoute;
  final bool isNotFound;

  @override
  List<Object?> get props => <Object?>[
    id,
    selectedItem,
    selectedRoute,
    isNotFound,
  ];
}

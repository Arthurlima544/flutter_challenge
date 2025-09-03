import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/place_entity.dart';
import '../../../../utils/helper_functions.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.place, super.key});
  final PlaceEntity place;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: mapOnTapByPlaceTitle(context, place),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          Semantics(
            label: 'Image of ${place.type}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: place.imageUrl,
                fit: BoxFit.fill,
                errorWidget: (_, _, _) => const Icon(Icons.error_outline),
              ),
            ),
          ),
          Center(
            child: Text(
              place.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

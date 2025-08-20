import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/place/place.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.place, super.key});
  final Place place;

  @override
  Widget build(BuildContext context) => Card(
    child: Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: place.imageUrl,
          fit: BoxFit.fill,
          errorWidget: (_, _, _) => const Icon(Icons.error_outline),
        ),
        Center(
          child: Text(
            place.title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

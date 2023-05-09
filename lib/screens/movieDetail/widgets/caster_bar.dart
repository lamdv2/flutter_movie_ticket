import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import 'caster_item.dart';

class CasterBar extends StatelessWidget {
  const CasterBar({
    super.key,
    required this.movie,
    required this.size,
  });

  final Movie? movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: movie!.casters!
            .map((e) => CasterItem(size: size, casters: e)).toList(),
      ),
    );
  }
}
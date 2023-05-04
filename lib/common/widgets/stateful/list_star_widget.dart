import 'package:flutter/cupertino.dart';
import 'package:movie_ticket/models/movie.dart';

import '../../../themes/app_styles.dart';
import '../stateless/star_half_widget.dart';
import '../stateless/star_widget.dart';

class ListStarWidget extends StatefulWidget {
  const ListStarWidget({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  State<ListStarWidget> createState() => _ListStarWidgetState();
}

class _ListStarWidgetState extends State<ListStarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.movie.star != null && widget.movie.star! >= 4)
          ...List.generate(4, (index) =>  const StarWidget()),
        if (widget.movie.star != null && widget.movie.star! > 4 && widget.movie.star! < 5)
          const StarHalfWidget(),
        if (widget.movie.star != null && widget.movie.star! == 5)
          ...List.generate(5, (index) => const StarWidget()),
        if (widget.movie.star != null && widget.movie.star! < 4)
          ...List.generate(3, (index) => const StarWidget()),
        if (widget.movie.star != null && widget.movie.star! > 3 && widget.movie.star! < 4)
          const StarHalfWidget(),
        Text(' (${widget.movie.star})', style: AppStyles.h5,),
      ],
    );
  }
}

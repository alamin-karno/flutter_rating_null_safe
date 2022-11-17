import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class FlutterRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;
  final Color borderColor;
  final double? size;
  final bool allowHalfRating;
  final MainAxisAlignment mainAxisAlignment;

  const FlutterRating({
    Key? key,
    this.starCount = 5,
    this.rating = 0.0,
    this.onRatingChanged,
    this.color = Colors.amber,
    this.borderColor = Colors.grey,
    this.size,
    this.allowHalfRating = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: List.generate(
            starCount,
            (index) => buildStar(context, index),
          ),
        ),
      ),
    );
  }

  buildStar(BuildContext context, int index) {
    Icon icon;
    double ratingSize = size ?? MediaQuery.of(context).size.width / starCount;

    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: borderColor,
        size: ratingSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: ratingSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: size ?? ratingSize,
      );
    }

    return InkResponse(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      radius: (size ?? ratingSize) / 2,
      // onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      onTapDown: onRatingChanged == null
          ? null
          : (tapDetails) {
              final tappedPosition = tapDetails.localPosition.dx;
              final tappedOnFirstHalf = tappedPosition <= ratingSize / 2;
              double value =
                  index + (tappedOnFirstHalf && allowHalfRating ? 0.5 : 1.0);
              onRatingChanged!(value);
            },
      child: SizedBox(
        height: (size ?? ratingSize) * 1.5,
        child: icon,
      ),
    );
  }
}

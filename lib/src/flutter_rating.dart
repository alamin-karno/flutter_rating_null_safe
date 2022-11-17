/* MIT License
Copyright (c) 2022 Md. Al-Amin
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';

/// [RatingChangedCallback] is the signature for a callback that reports that the
/// user has selected a new rating.
/// [double] is the new rating.
typedef RatingChangeCallback = void Function(double rating);

/// [FlutterRatingBar] is a widget that displays a rating bar.
/// The rating bar can be customized by changing the [starCount], [size],
/// [rating], [mainAxisAlignment], [allowHalfRating], [borderColor],
/// [color], [onRatingChanged]
class FlutterRating extends StatelessWidget {
  /// [starCount] is the number of stars to display.
  /// [starCount] defaults value is 5.
  final int starCount;

  /// [rating] is the current rating.
  /// [rating] defaults value is 0.0.
  final double rating;

  /// [onRatingChanged] is the callback when the user selects a new rating.
  final RatingChangeCallback? onRatingChanged;

  /// [color] is the color of the filled stars.
  /// [color] defaults value is Colors.amber.
  final Color color;

  /// [borderColor] is the color of the border of the stars.
  /// [borderColor] defaults value is Colors.grey.
  final Color borderColor;

  /// [size] is the size of the stars.
  /// [size] defaults value is MediaQuery.of(context).size.width / starCount.
  final double? size;

  /// [allowHalfRating] is a boolean value that determines if the rating can be
  /// a half value.
  /// [allowHalfRating] defaults value is false.
  final bool allowHalfRating;

  /// [mainAxisAlignment] is the alignment of the stars.
  /// [mainAxisAlignment] defaults value is MainAxisAlignment.start.
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

  /// [buildStar] is a method that returns stars.
  /// [index] is the index of the star.
  /// [buildStar] returns a [GestureDetector] that contains a [Icon].
  /// If [allowHalfRating] is true, the star is filled if the rating is greater
  /// than or equal to the index of the star.
  /// If [allowHalfRating] is false, the star is filled if the rating is greater
  /// than the index of the star.
  /// If [onRatingChanged] is not null, the [GestureDetector] is clickable.
  /// If [onRatingChanged] is null, the [GestureDetector] is not clickable.
  /// If the user clicks on the star, the [onRatingChanged] method is called.
  buildStar(BuildContext context, int index) {
    Icon icon;

    /// [ratingStar] is the rating of the star.
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

import 'package:flutter/material.dart';

const _maxMark = 5;

class StarsRating extends StatefulWidget {
  final double mark;
  final TextStyle? markTextStyle;

  const StarsRating({
    Key? key,
    required this.mark,
    this.markTextStyle,
  }) : super(key: key);

  @override
  State<StarsRating> createState() => _StarsRatingState();
}

class _StarsRatingState extends State<StarsRating> {
  bool get hasFractionalPart => widget.mark - widget.mark.toInt() > 0;

  int get amountOfEmptyStars {
    if (hasFractionalPart) {
      return _maxMark - widget.mark.toInt() - 1;
    }
    return _maxMark - widget.mark.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < widget.mark.toInt(); i++)
          _buildStarIcon(Icons.star),
        if (hasFractionalPart) _buildStarIcon(Icons.star_half),
        for (int i = 0; i < amountOfEmptyStars; i++)
          _buildStarIcon(Icons.star_border),
      ],
    );
  }

  Widget _buildStarIcon(IconData iconData) {
    return Icon(
      iconData,
      color: Colors.amber,
    );
  }
}

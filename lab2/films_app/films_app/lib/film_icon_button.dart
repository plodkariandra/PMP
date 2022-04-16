import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmIconButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  const FilmIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            size: 32,
            color: isActive ? Colors.blue : Colors.grey,
          ),
          onPressed: onPressed,
        ),
        Text(
          title,
          style: GoogleFonts.rubik(
            fontSize: 18,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}

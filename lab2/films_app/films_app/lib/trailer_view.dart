import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class TrailerView extends StatefulWidget {
  final PodPlayerController controller;

  const TrailerView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TrailerView> createState() => _TrailerViewState();
}

class _TrailerViewState extends State<TrailerView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PodVideoPlayer(
          controller: widget.controller,
        ),
        _buildBlur(),
      ],
    );
  }

  Widget _buildBlur() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white,
          ],
          stops: [0.5, 1],
        ),
      ),
    );
  }
}

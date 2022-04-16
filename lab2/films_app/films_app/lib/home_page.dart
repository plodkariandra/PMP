import 'package:films_app/film.dart';
import 'package:films_app/film_icon_button.dart';
import 'package:films_app/films_mock.dart';
import 'package:films_app/poster_view.dart';
import 'package:films_app/stars_rating.dart';
import 'package:films_app/trailer_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pod_player/pod_player.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Film> _myFilms = [];
  final List<Film> _liked = [];

  late final PodPlayerController controller;

  Film currentFilm = films.first;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(currentFilm.videoUrl),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onPlusPressed() {
    setState(() {
      if (_myFilms.contains(currentFilm)) {
        _myFilms.remove(currentFilm);
      } else {
        _myFilms.add(currentFilm);
      }
    });
  }

  void _onLikePressed() {
    setState(() {
      if (_liked.contains(currentFilm)) {
        _liked.remove(currentFilm);
      } else {
        _liked.add(currentFilm);
      }
    });
  }

  void _onSharePressed() async {
    await Share.share('Let\'s watch together ${currentFilm.name}! '
        'Trailer: ${currentFilm.videoUrl}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrailerView(
              controller: controller,
            ),
            const SizedBox(height: 16),
            _buildFilmWithPoster(),
            _buildCastAndDirectors(),
            _buildActions(),
            _buildTitle(),
            _buildFilms(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilms(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: films.map<Widget>((item) {
          if (currentFilm == item) {
            return const SizedBox.shrink();
          }
          return PosterView(
            url: item.posterUrl,
            onPressed: () {
              setState(() {
                currentFilm = item;
                controller.changeVideo(
                  playVideoFrom: PlayVideoFrom.youtube(
                    item.videoUrl,
                  ),
                );
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'SIMILAR LIKE THIS',
        style: GoogleFonts.rubik(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      child: Row(
        children: [
          FilmIconButton(
            iconData: Icons.add,
            onPressed: _onPlusPressed,
            title: 'My List',
            isActive: _myFilms.contains(currentFilm),
          ),
          const Spacer(),
          FilmIconButton(
            iconData: Icons.thumb_up,
            onPressed: _onLikePressed,
            title: 'Rate',
            isActive: _liked.contains(currentFilm),
          ),
          const Spacer(),
          FilmIconButton(
            iconData: Icons.share,
            onPressed: _onSharePressed,
            title: 'Share',
          ),
        ],
      ),
    );
  }

  Widget _buildCastAndDirectors() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSpan('Cast: ', currentFilm.cast),
          const SizedBox(height: 16),
          _buildSpan('Directors: ', currentFilm.directors)
        ],
      ),
    );
  }

  Widget _buildSpan(String title, String value) {
    return RichText(
      text: TextSpan(
        text: title,
        style: GoogleFonts.rubik(
          fontSize: 24,
          color: Colors.grey,
        ),
        children: [
          TextSpan(
            text: value,
            style: GoogleFonts.rubik(
              fontSize: 24,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFilmWithPoster() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          PosterView(url: currentFilm.posterUrl),
          const SizedBox(width: 16),
          Expanded(
            child: _buildFilmInfo(),
          )
        ],
      ),
    );
  }

  Widget _buildFilmInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${currentFilm.year} • ${currentFilm.type}'.toUpperCase(),
          style: GoogleFonts.rubik(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          currentFilm.name,
          style: GoogleFonts.rubik(
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 4),
        StarsRating(mark: currentFilm.rating),
        const SizedBox(height: 12),
        Text(
          currentFilm.description,
          overflow: TextOverflow.fade,
          style: GoogleFonts.rubik(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

import 'package:equatable/equatable.dart';

class Film extends Equatable {
  final String videoUrl;
  final int year;
  final String type;
  final String name;
  final String posterUrl;
  final double rating;
  final String description;
  final String cast;
  final String directors;

  const Film({
    required this.videoUrl,
    required this.year,
    required this.type,
    required this.name,
    required this.posterUrl,
    required this.rating,
    required this.description,
    required this.cast,
    required this.directors,
  });

  @override
  List<Object> get props {
    return [
      videoUrl,
      year,
      type,
      name,
      posterUrl,
      rating,
      description,
      cast,
      directors,
    ];
  }
}

class MovieEntity {
  final int? id;
  final String? url;
  final String? title;
  final String? titleEnglish;
  final int? year;
  final double? rating;
  final int? runtime;
  final List<String>? genres;
  final String? summary;
  final String? descriptionFull;
  final String? backgroundImage;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;

  const MovieEntity({
    this.id,
    this.url,
    this.title,
    this.titleEnglish,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.backgroundImage,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
  });
}

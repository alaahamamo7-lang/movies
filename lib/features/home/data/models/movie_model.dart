import 'package:movies/features/home/domain/entities/movie.dart';

class MovieModel {
  final String? status;
  final String? statusMessage;
  final Data? data;
  final Meta? meta;

  const MovieModel({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      meta: json['@meta'] != null
          ? Meta.fromJson(json['@meta'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    if (meta != null) {
      map['@meta'] = meta!.toJson();
    }
    return map;
  }

  MovieModel copyWith({
    String? status,
    String? statusMessage,
    Data? data,
    Meta? meta,
  }) {
    return MovieModel(
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }
}


class Meta {
  final Migration? migration;
  final int? apiVersion;
  final String? executionTime;

  const Meta({
    this.migration,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      migration: json['migration'] != null
          ? Migration.fromJson(json['migration'] as Map<String, dynamic>)
          : null,
      apiVersion: (json['api_version'] as num?)?.toInt(),
      executionTime: json['execution_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (migration != null) {
      map['migration'] = migration!.toJson();
    }
    map['api_version'] = apiVersion;
    map['execution_time'] = executionTime;
    return map;
  }

  Meta copyWith({
    Migration? migration,
    int? apiVersion,
    String? executionTime,
  }) {
    return Meta(
      migration: migration ?? this.migration,
      apiVersion: apiVersion ?? this.apiVersion,
      executionTime: executionTime ?? this.executionTime,
    );
  }
}


class Migration {
  final String? message;
  final String? oldBase;
  final String? newBase;
  final String? sunset;

  const Migration({
    this.message,
    this.oldBase,
    this.newBase,
    this.sunset,
  });

  factory Migration.fromJson(Map<String, dynamic> json) {
    return Migration(
      message: json['message'] as String?,
      oldBase: json['old_base'] as String?,
      newBase: json['new_base'] as String?,
      sunset: json['sunset'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'old_base': oldBase,
      'new_base': newBase,
      'sunset': sunset,
    };
  }

  Migration copyWith({
    String? message,
    String? oldBase,
    String? newBase,
    String? sunset,
  }) {
    return Migration(
      message: message ?? this.message,
      oldBase: oldBase ?? this.oldBase,
      newBase: newBase ?? this.newBase,
      sunset: sunset ?? this.sunset,
    );
  }
}


class Data {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<Movie>? movies;

  const Data({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movieCount: (json['movie_count'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      pageNumber: (json['page_number'] as num?)?.toInt(),
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies!.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Data copyWith({
    int? movieCount,
    int? limit,
    int? pageNumber,
    List<Movie>? movies,
  }) {
    return Data(
      movieCount: movieCount ?? this.movieCount,
      limit: limit ?? this.limit,
      pageNumber: pageNumber ?? this.pageNumber,
      movies: movies ?? this.movies,
    );
  }
}


typedef Movies = Movie;

class Movie extends MovieEntity {
  final String? imdbCode;
  final String? titleLong;
  final String? slug;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImageOriginal;
  final String? state;
  final List<Torrent>? torrents;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  const Movie({
    super.id,
    super.url,
    this.imdbCode,
    super.title,
    super.titleEnglish,
    this.titleLong,
    this.slug,
    super.year,
    super.rating,
    super.runtime,
    super.genres,
    super.summary,
    super.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    super.backgroundImage,
    this.backgroundImageOriginal,
    super.smallCoverImage,
    super.mediumCoverImage,
    super.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      imdbCode: json['imdb_code'] as String?,
      title: json['title'] as String?,
      titleEnglish: json['title_english'] as String?,
      titleLong: json['title_long'] as String?,
      slug: json['slug'] as String?,
      year: (json['year'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      summary: json['summary'] as String?,
      descriptionFull: json['description_full'] as String?,
      synopsis: json['synopsis'] as String?,
      ytTrailerCode: json['yt_trailer_code'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpa_rating'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageOriginal: json['background_image_original'] as String?,
      smallCoverImage: json['small_cover_image'] as String?,
      mediumCoverImage: json['medium_cover_image'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
      state: json['state'] as String?,
      torrents: (json['torrents'] as List<dynamic>?)
          ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents!.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

  Movie copyWith({
    int? id,
    String? url,
    String? imdbCode,
    String? title,
    String? titleEnglish,
    String? titleLong,
    String? slug,
    int? year,
    double? rating,
    int? runtime,
    List<String>? genres,
    String? summary,
    String? descriptionFull,
    String? synopsis,
    String? ytTrailerCode,
    String? language,
    String? mpaRating,
    String? backgroundImage,
    String? backgroundImageOriginal,
    String? smallCoverImage,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? state,
    List<Torrent>? torrents,
    String? dateUploaded,
    int? dateUploadedUnix,
  }) {
    return Movie(
      id: id ?? this.id,
      url: url ?? this.url,
      imdbCode: imdbCode ?? this.imdbCode,
      title: title ?? this.title,
      titleEnglish: titleEnglish ?? this.titleEnglish,
      titleLong: titleLong ?? this.titleLong,
      slug: slug ?? this.slug,
      year: year ?? this.year,
      rating: rating ?? this.rating,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      summary: summary ?? this.summary,
      descriptionFull: descriptionFull ?? this.descriptionFull,
      synopsis: synopsis ?? this.synopsis,
      ytTrailerCode: ytTrailerCode ?? this.ytTrailerCode,
      language: language ?? this.language,
      mpaRating: mpaRating ?? this.mpaRating,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      backgroundImageOriginal:
          backgroundImageOriginal ?? this.backgroundImageOriginal,
      smallCoverImage: smallCoverImage ?? this.smallCoverImage,
      mediumCoverImage: mediumCoverImage ?? this.mediumCoverImage,
      largeCoverImage: largeCoverImage ?? this.largeCoverImage,
      state: state ?? this.state,
      torrents: torrents ?? this.torrents,
      dateUploaded: dateUploaded ?? this.dateUploaded,
      dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
    );
  }
}


typedef Torrents = Torrent;

class Torrent {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final String? isRepack;
  final String? videoCodec;
  final String? bitDepth;
  final String? audioChannels;
  final int? seeds;
  final int? peers;
  final String? size;
  final int? sizeBytes;
  final String? dateUploaded;
  final int? dateUploadedUnix;

  const Torrent({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      quality: json['quality'] as String?,
      type: json['type'] as String?,
      isRepack: json['is_repack'] as String?,
      videoCodec: json['video_codec'] as String?,
      bitDepth: json['bit_depth'] as String?,
      audioChannels: json['audio_channels'] as String?,
      seeds: (json['seeds'] as num?)?.toInt(),
      peers: (json['peers'] as num?)?.toInt(),
      size: json['size'] as String?,
      sizeBytes: (json['size_bytes'] as num?)?.toInt(),
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'hash': hash,
      'quality': quality,
      'type': type,
      'is_repack': isRepack,
      'video_codec': videoCodec,
      'bit_depth': bitDepth,
      'audio_channels': audioChannels,
      'seeds': seeds,
      'peers': peers,
      'size': size,
      'size_bytes': sizeBytes,
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
    };
  }

  Torrent copyWith({
    String? url,
    String? hash,
    String? quality,
    String? type,
    String? isRepack,
    String? videoCodec,
    String? bitDepth,
    String? audioChannels,
    int? seeds,
    int? peers,
    String? size,
    int? sizeBytes,
    String? dateUploaded,
    int? dateUploadedUnix,
  }) {
    return Torrent(
      url: url ?? this.url,
      hash: hash ?? this.hash,
      quality: quality ?? this.quality,
      type: type ?? this.type,
      isRepack: isRepack ?? this.isRepack,
      videoCodec: videoCodec ?? this.videoCodec,
      bitDepth: bitDepth ?? this.bitDepth,
      audioChannels: audioChannels ?? this.audioChannels,
      seeds: seeds ?? this.seeds,
      peers: peers ?? this.peers,
      size: size ?? this.size,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      dateUploaded: dateUploaded ?? this.dateUploaded,
      dateUploadedUnix: dateUploadedUnix ?? this.dateUploadedUnix,
    );
  }
}
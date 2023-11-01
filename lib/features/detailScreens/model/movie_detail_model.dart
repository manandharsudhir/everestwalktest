import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

MovieDetailModel movieDetailModelFromJson(String str) =>
    MovieDetailModel.fromJson(json.decode(str));

String? movieDetailModelToJson(MovieDetailModel data) =>
    json.encode(data.toJson());

@freezed
class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    int? budget,
    @Default([]) List<Genre> genres,
    String? homepage,
    int? id,
    @JsonKey(name: "imdb_id") String? imdbId,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "production_companies")
    @Default([])
    List<ProductionCompany> productionCompanies,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    int? revenue,
    int? runtime,
    @JsonKey(name: "spoken_languages")
    @Default([])
    List<SpokenLanguage> spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    int? id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    int? id,
    @JsonKey(name: "logo_path") String? logoPath,
    String? name,
    @JsonKey(name: "origin_country") String? originCountry,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: "english_name") String? englishName,
    String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}

import 'package:movie_ticket/utils/helper.dart';

import 'cast.dart';

class Movie {
  int id;
  String? name;
  String? type;
  String? background;
  double? star;
  List<Cast>? casters;
  List<String>? trailers;

  Movie({required this.id, this.name, this.type, this.background, this.star, this.casters, this.trailers});

  getType() {
    return type.toString();
  }

  getBgr() {
    return background.toString();
  }

  getStar(){
    return star.toString();
  }
}

List<Movie> movies = [];

List<int> listIds = [1, 2, 3, 4, 5, 6];

List<String> listNames = [
  'Dragon Training',
  'Frozen 2',
  'Onward',
  'Ralph Internet',
  'Scoob',
  'Lab Krixi'
];

List<String> listTypes = [
  'All',
  'Action',
  'Drama',
  'Horror',
  'Humorous',
  'Tail',
];

List<String> listImgBackgrounds = [
  AssetHelper.imgDragon,
  AssetHelper.imgFrozen,
  AssetHelper.imgOnward,
  AssetHelper.imgRalph,
  AssetHelper.imgScoob,
  AssetHelper.imgSpongebob,
];

List<double> listStars = [4.5, 4.7, 4.2, 4.0, 4.5, 3.9];

List<String> listImgTrailers = [
  AssetHelper.imgTrailer1,
  AssetHelper.imgTrailer2,
  AssetHelper.imgMovieBanner,
  AssetHelper.imgMoviePoster,
  AssetHelper.imgMoviePoster2,
  AssetHelper.imgMoviePoster3,
];

Movie getMovieId(int id) {
  return Movie(id: id);
}

Movie getMovieName(int id, String name) {
  return Movie(id: id, name: name);
}

Movie getMovieType(int id, String type) {
  return Movie(id: id, type: type);
}

Movie getMovieBackground(int id, String bgr) {
  return Movie(id: id, background: bgr);
}

Movie getMovieStar(int id, double star) {
  return Movie(id: id, star: star);
}

Movie getMovieCasters(int id, List<Cast> listCasts) {
  return Movie(id: id, casters: listCasts);
}

Movie getMovieTrailers(int id, List<String> listTrailers) {
  return Movie(id: id, trailers: listTrailers);
}

List<Movie> addListMovie(List<Movie> genres) {
  genres = listIds.map((id) => getMovieId(id)).toList();
  for (int i = 0; i < genres.length; i++) {
    genres[i].name = getMovieName(listIds[i], listNames[i]).name;
    genres[i].type = getMovieType(listIds[i], listTypes[i]).type;
    genres[i].background = getMovieBackground(listIds[i], listImgBackgrounds[i]).background;
    genres[i].star = getMovieStar(listIds[i], listStars[i]).star;
    genres[i].casters = getMovieCasters(listIds[i], listCasters).casters;
    genres[i].trailers = getMovieTrailers(listIds[i], listImgTrailers).trailers;
  }
  return genres;
}

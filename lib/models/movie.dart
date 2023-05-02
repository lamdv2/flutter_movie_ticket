import 'package:movie_ticket/utils/helper.dart';

class Movie {
  int id;
  String? name;
  String? type;
  String? background;
  double? star;

  Movie({required this.id, this.name, this.type, this.background, this.star});

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

List<Movie> addListMovie(List<Movie> genres) {
  genres = listIds.map((id) => getMovieId(id)).toList();
  for (int i = 0; i < genres.length; i++) {
    genres[i].name = getMovieName(listIds[i], listNames[i]).name;
    genres[i].type = getMovieType(listIds[i], listTypes[i]).type;
    genres[i].background = getMovieBackground(listIds[i], listImgBackgrounds[i]).background;
    genres[i].star = getMovieStar(listIds[i], listStars[i]).star;
  }
  return genres;
}

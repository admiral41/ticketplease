import '../Models/Movie_model.dart';
import '../Models/ad_slider_model.dart';
import '../Models/menu_model.dart';
import 'constants.dart';

List<AdSliderModel> sliderData = [
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Movies", asset: "assets/icons/film.svg"),
  MenuModel(name: "Events", asset: "assets/icons/spotlights.svg"),
  MenuModel(name: "Plays", asset: "assets/icons/theater_masks.svg"),
  MenuModel(name: "Sports", asset: "assets/icons/running.svg"),
  MenuModel(name: "Activity", asset: "assets/icons/flag.svg"),
  MenuModel(name: "Monum", asset: "assets/icons/pyramid.svg"),
];
List<String> cities = [
  "Kathmandu",
  "Bhaktapur",
  "Pokhara",
  "Biratnagar",
  "Dharan",
];
List<MovieModel> movies = [
  MovieModel(
    title: "Bigil",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.png",
  ),
  MovieModel(
    title: "Kaithi",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie2.png",
  ),
  MovieModel(
    title: "Asuran",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie3.png",
  ),
  MovieModel(
    title: "Sarkar",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie4.png",
  ),
];

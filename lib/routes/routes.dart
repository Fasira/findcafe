import 'package:get/get.dart';
import 'package:minipro_app/pages/favorite.dart';
import 'package:minipro_app/pages/home.dart';
import 'package:minipro_app/pages/landing.dart';
import 'package:minipro_app/pages/authentication/login.dart';
import 'package:minipro_app/pages/profile.dart';
import 'package:minipro_app/pages/search.dart';
import 'package:minipro_app/pages/setting.dart';
import 'package:minipro_app/pages/authentication/signup.dart';

class AppPage{
  static List<GetPage> routes = [
    GetPage(name: home, page: ()=> const HomePage()),
    GetPage(name: search, page: ()=> const SearchPage()),
    // GetPage(name: favorite, page: ()=> const FavoritePage()),
    GetPage(name: profile, page: ()=> const ProfilePage()),
    GetPage(name: setting, page: ()=> const SettingPage()),
    GetPage(name: landing, page: ()=> const LandingPage()),
    GetPage(name: login, page: ()=> const LoginPage()),
    GetPage(name: signup, page: ()=> const SignUpPage()),
  ];

  static gethome() => home;
  static getsearch() => search;
  static getfavorite() => favorite;
  static getprofile() => profile;
  static getsetting() => setting;
  static getlanding() => landing;
  static getlogin() => login;
  static getsignup() => signup;

  static String home = '/home';
  static String search = '/search';
  static String favorite = '/favorite';
  static String profile = '/profile';
  static String setting = '/setting';
  static String landing = '/landing';
  static String login = '/login';
  static String signup = '/signup';
}
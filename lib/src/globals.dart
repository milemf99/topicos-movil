import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:topicos_clinica/src/pages/homePage.dart';
import 'package:topicos_clinica/src/pages/loginPage.dart';
import 'package:topicos_clinica/src/pages/reservePage.dart';
import 'package:topicos_clinica/src/pages/registerPage.dart';
import 'package:topicos_clinica/src/pages/calendarReservePage.dart';

const API_URL = "http://67.205.186.119:8080";

// ROUTES
class Routes {
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const reserve = '/reserve';
  static const calendarReserve = '/calendarReserve';
}

// STORAGE
final box = GetStorage();

// PAGEROUTES
final pages = [
  GetPage(name: Routes.home, page: () => HomePage()),
  GetPage(name: Routes.login, page: () => LoginPage()),
  GetPage(name: Routes.register, page: () => RegisterPage()),
  GetPage(name: Routes.reserve, page: () => ReservePage()),
  GetPage(name: Routes.calendarReserve, page: () => CalendarReservePage()),
];

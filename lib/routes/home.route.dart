import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../features/home/view/home.view.dart';
import '../app/app.controller.dart';

class HomeRoutes {
  static const homeRoute = '/';

  static final routes = [
    GetPage(
      name: homeRoute,
      page: () => const HomeView(key: Key('homeView')),
      binding: AppBinding(),
    )
  ];
}
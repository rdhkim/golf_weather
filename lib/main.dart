import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golf_weather/pages/home.dart';
import 'package:golf_weather/pages/add_city.dart';

void main() {
  runApp(GolfWeatherBooking());
}

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return CityWeather();
      },
    ),
	GoRoute(
		path: '/add_city',
		builder: (context, state) {
			return AddCity();
			}
		)
  ],
);

class GolfWeatherBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

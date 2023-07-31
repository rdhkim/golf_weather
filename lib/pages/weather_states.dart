import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/weather.dart';

class CityWeather extends StatefulWidget {
	@override
	CityWeatherState createState() => CityWeatherState();
}

class CityWeatherState extends State<CityWeather> {
	final cities = [
		'Toronto',
		'Mississauga',
		'Brampton',
	];
	
	final _citiesWeather = [];
	
	void _fetchInitialCityWeather() async {
		const WEATHER_API_KEY = '32e0b7d3ea253ead457145ad787ba7e6';
		WeatherFactory wf = WeatherFactory(WEATHER_API_KEY);

		for (var city in cities) {
			var currData = await wf.fiveDayForecastByCityName(city);
			_citiesWeather.add(currData);
		}
	}

	void initialState() {
		super.initState();
		_fetchInitialCityWeather();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text("Golf Weather Booking"),
				backgroundColor: Colors.green,
			),
			body: Center(
				child: ListView(
					shrinkWrap: true,
					padding: const EdgeInsets.all(20.0),
					children: [
						Text("ASD")
					],
				),
			),
		);
	}
}
// JUST MAKE SUPER BASIC 
// HAVE NAME OF CITY
// FETCH WEWATHER AND DISPLAY
// WORRY ABOUT STATES LATER

// class Home extends StatefulWidget {
	
	
// 	@override
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			appBar: AppBar(
// 				title: const Text("Golf Weather Booking"),
// 				backgroundColor: Colors.green,
// 				),
// 			body: Center(
// 				child: ListView(
// 					shrinkWrap: true,
// 						padding: const EdgeInsets.all(20.0),
// 						children: [
// 							Text("ASD")
// 						],
// 				),
// 			),
// 		);
// 	}
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/weather.dart';
class CityWeather extends StatefulWidget {
	const CityWeather({super.key});

	@override
	State<CityWeather> createState() => _cityWeatherState();
}

class _cityWeatherState extends State<CityWeather> {
	var _cities = [
		'Toronto',
		'Mississauga',
		'Brampton',
	];
	
	var _citiesWeather = {};
	
	void _fetchCityWeather() async {
		const WEATHER_API_KEY = '32e0b7d3ea253ead457145ad787ba7e6';
		WeatherFactory wf = WeatherFactory(WEATHER_API_KEY);

		for (var city in _cities) {
			var currData = await wf.fiveDayForecastByCityName(city);
			_citiesWeather[city] = [];
			
			for (var day in currData) {
				_citiesWeather[city].add({
					'Date': day.date.toString(),
					'Weather': day.weatherDescription,
					'Temp': day.temperature.toString(),
					'Wind': day.windSpeed.toString(),
				});
			}

		}
		setState(
			() {_citiesWeather = _citiesWeather;}
		);
	}

	void initialState() {
		super.initState();
		_fetchCityWeather();
	}

	@override
	Widget build(BuildContext context) {
		_fetchCityWeather();
		print(_citiesWeather);

		return Scaffold(
			appBar: AppBar(
				title: const Text("Golf Weather Bookin"),
				backgroundColor: Colors.green,
			),
			body: Center(
				child: Column(
					children: [
						for (var city in _citiesWeather.keys) 
						Row(
							children: [
								Text(city),
								for (var dayData in _citiesWeather[city]) Column(
									children: [
										for (var data in dayData.keys) Text(dayData[data])
									]
								)
							]
						)
					],
				),
			),
		);
	}
}

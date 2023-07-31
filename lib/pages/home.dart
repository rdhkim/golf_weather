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

	_generateRow(var city) {
		return Column(
			children: [
				Divider( color: Colors.black),
				Row(
					children: [
						Row(
							children: [
								Text(city),
								for (var dayData in _citiesWeather[city])
								Card(
									shadowColor: Colors.blueAccent,
									child: Column(
										children: [
											for (var data in dayData.keys) 
												Text(dayData[data])
										]
									),
								),
							],
						)
					]
				),
				Divider(color: Colors.black),
			]);
		}
	
	void _fetchCityWeather() async {
		const WEATHER_API_KEY = '32e0b7d3ea253ead457145ad787ba7e6';
		WeatherFactory wf = WeatherFactory(WEATHER_API_KEY);

		var dayData =
      	{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" };

  		var monthData = 
		{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" };

		var timeData = 
		{ "1": "1 AM", "2": "2 AM", "3": "3 AM", "4": "4 AM", "5": "5 AM", "6": "6 AM", "7": "7 AM", "8": "8 AM", "9": "9 AM", "10": "10 AM", "11": "11 AM", "12": "12 PM",
		"13": "1 PM", "14": "2 PM", "15": "3 PM", "16": "4 PM", "17": "5 PM", "18": "6 PM", "19": "7 PM", "20": "8 PM", "21": "9 PM", "22": "10 PM", "23": "11 PM", "24": "12 AM"};
	

		for (var city in _cities) {
			var currData = await wf.fiveDayForecastByCityName(city);
			_citiesWeather[city] = [];
			
			for (var day in currData) {
				_citiesWeather[city].add({
					'Date': (monthData[day.date?.month.toString()].toString() + ' ' + (day.date?.day).toString()),
					'Time': timeData[day.date?.hour.toString()],
					'Weather': 'Forecase: ' + day.weatherDescription.toString(),
					'Temp': day.temperature.toString(),
					'Wind': 'Wind Speeds: ' + day.windSpeed.toString() + 'm/s',
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

		return Scaffold(
			appBar: AppBar(
				title: const Text("City weather"),
				backgroundColor: Colors.green,
			),
			body: Center(
				child: Column(
					children: [
						for (var city in _citiesWeather.keys) _generateRow(city)
					],
				),
			),
		);
	}
}

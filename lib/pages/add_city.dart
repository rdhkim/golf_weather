import 'package:flutter/material.dart';

class AddCity extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text("Add New City")
			),
			body: Center(
				child: TextField(
					decoration: InputDecoration(
						border: OutlineInputBorder(),
						hintText: "Enter a city to get weather data for.",
					),
				),
			),
		);
	}
}
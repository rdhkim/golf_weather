import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
							Text("Toronto"),
                            Text("Mississauga"),
                            Text("Brampton")
						],
                        // make a new page that shows the city name and weather info 
				),
			),
		);
	}
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClipperPro'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome to ClipperPro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Find the best barbers near you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                RaisedButton(
                  onPressed: () {
                    // Action when the button is pressed
                  },
                  color: Colors.white,
                  textColor: Colors.blue,
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual number of barbers
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/barber_avatar.png'), // Replace with actual barber avatar image
                  ),
                  title: const Text('Barber Name'), // Replace with actual barber name
                  subtitle: const Text('Barber Specialization'), // Replace with actual specialization
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Action when the barber tile is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

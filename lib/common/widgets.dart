import 'package:flutter/material.dart';
import 'controllers.dart';

class MassagePage extends StatelessWidget {
  const MassagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MassageController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MassageButton(
            text: 'TURN ON THE MASSAGER',
            color: Colors.lightBlue,
            onPressed:
                () => controller.sendRequest(
                  context,
                  true,
                  'https://jsonplaceholder.typicode.com/',
                ),
          ),
          MassageButton(
            text: 'TURN OFF THE MASSAGER',
            color: Colors.lightBlue,
            onPressed:
                () => controller.sendRequest(
                  context,
                  false,
                  'https://jsonplaceholder.typicode.com/',
                ),
          ),
        ],
      ),
    );
  }
}

class MassageButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const MassageButton({
    required this.text,
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(text),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: 300,
        child: ElevatedButton(
          onPressed: () => controller.purchase(context),
          child: Text('PAY FOR THE MASSAGER'),
        ),
      ),
    );
  }
}

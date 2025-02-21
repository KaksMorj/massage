import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MassageController extends ChangeNotifier {
  Future<void> sendRequest(
    BuildContext context,
    bool isTurnOn,
    String uri,
  ) async {
    String text =
        isTurnOn ? 'Successfully turned on' : 'Successfully turned off';
    Color color = isTurnOn ? Colors.green : Colors.blueGrey;

    try {
      final response = await http.get(Uri.parse(uri));
    } catch (e) {
      text = e.toString();
      color = Colors.red;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text), backgroundColor: color));
  }
}

class HomePageController extends ChangeNotifier {
  void purchase(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('SUCCESFULLY PAID'), backgroundColor: Colors.blue),
    );

    Navigator.pushNamed(context, '/massage');
  }
}


import 'package:flutter/material.dart';
import 'utilities.dart';
class VsjTwo extends StatefulWidget {
  _VsjTwo createState() {
    return _VsjTwo();
  }
}

class _VsjTwo extends State<VsjTwo> with SingleTickerProviderStateMixin {
  String data = "";

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text(Utilities.currentquizname)),
      body: Column(
        children: [

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Go back to VSJ one'),
            ),
          ),

          Text(data),

     
        ],
      ),
    );
  }
}
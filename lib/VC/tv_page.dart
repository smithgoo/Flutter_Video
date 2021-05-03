import 'package:flutter/material.dart';

class TVPage extends StatefulWidget {
  TVPage({Key key}) : super(key: key);

  @override
  _TVPageState createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('电视'),
      ),
    );
  }
}

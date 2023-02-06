
import 'package:flutter/material.dart';

import '../../constants/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Home Screen'),
        onPressed: ()  {
        },
      ),
    );
  }
}

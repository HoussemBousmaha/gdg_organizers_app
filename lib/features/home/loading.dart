import 'package:flutter/material.dart';
import '../../constants/const.dart';
import '../../shared/widgets/gdg_logo.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlue,
      child: const Center(child: GdgLogo()),
    );
  }
}

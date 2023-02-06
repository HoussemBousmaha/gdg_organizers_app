import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/auth/widgets/authwidgets.dart';
import 'package:gdg_organizers_app/shared/widgets/gdgLogo.dart';

import '../auth/screens/authscreen.dart';

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

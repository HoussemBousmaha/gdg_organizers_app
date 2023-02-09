import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/shared/widgets/gdgLogo.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black.withOpacity(0.4),
        child: const Center(
          child: GdgLogo(
            size: 20,
          ),
        ));
  }
}

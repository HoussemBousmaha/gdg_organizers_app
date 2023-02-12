import 'package:flutter/material.dart';

import 'gdg_logo.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: const Center(child: GdgLogo(size: 20)),
    );
  }
}

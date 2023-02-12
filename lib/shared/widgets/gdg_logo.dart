import 'package:flutter/material.dart';

import '../../constants/const.dart';

class GdgLogo extends StatefulWidget {
  const GdgLogo({super.key, this.size = 30});
  final double size;

  @override
  State<GdgLogo> createState() => _GdgLogoState();
}

class _GdgLogoState extends State<GdgLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double get size => widget.size;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1, milliseconds: 500))..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size(size, size),
        child: GdgLogoAnimation(
          controller: _controller,
        ));
  }
}

class GdgLogoAnimation extends StatelessWidget {
  final AnimationController controller;

  GdgLogoAnimation({Key? key, required this.controller})
      : animations = List.generate(
          4,
          (index) => ColorTween(
            begin: Colors.white,
            end: [kYellow, kGreen, kRed, kBlue][index],
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(index / 4, (index + 1) / 4, curve: Curves.elasticInOut),
            ),
          ),
        ),
        super(key: key);

  final List<Animation<Color?>> animations;

  @override
  Widget build(BuildContext context) => CustomPaint(painter: GdgLogoPainter(animations));
}

class GdgLogoPainter extends CustomPainter {
  GdgLogoPainter(this.animations) : super(repaint: animations[0]);
  final List<Animation<Color?>> animations;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double stroke = size.width / 2;
    final double backgroundstrock = stroke + 2;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = backgroundstrock
      ..color = Colors.white;

    // this is points of the logo path  (x1,y2) (x2,y1) (x3,y2) (x4,y1) , dont change it
    // the first line is the background line and the second line is the color line
    final double x1 = width * 1.95;
    final double x2 = width * 0.95;
    final double x3 = -width * 1.05;
    final double x4 = -0.05 * width;
    final double y2 = height * 0.5;
    final double y1 = height;
    canvas.drawLine(Offset(x1, y2), Offset(x2, y1), paint);
    paint.strokeWidth = stroke;
    paint.color = animations[0].value!;
    canvas.drawLine(Offset(x1, y2), Offset(x2, y1), paint);
    paint.color = Colors.white;
    paint.strokeWidth = backgroundstrock;
    canvas.drawLine(Offset(x1, y2), Offset(x2, 0), paint);
    paint.color = animations[1].value!;
    paint.strokeWidth = stroke;
    canvas.drawLine(Offset(x1, y2), Offset(x2, 0), paint);
    paint.color = Colors.white;
    paint.strokeWidth = backgroundstrock;
    canvas.drawLine(Offset(x3, y2), Offset(x4, 0), paint);
    paint.color = animations[2].value!;
    paint.strokeWidth = stroke;
    canvas.drawLine(Offset(x3, y2), Offset(x4, 0), paint);
    paint.color = Colors.white;
    paint.strokeWidth = backgroundstrock;
    canvas.drawLine(Offset(x3, y2), Offset(x4, y1), paint);
    paint.color = animations[3].value!;
    paint.strokeWidth = stroke;
    canvas.drawLine(Offset(x3, y2), Offset(x4, y1), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

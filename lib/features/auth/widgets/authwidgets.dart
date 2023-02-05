import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math ;

import '../../../constants/const.dart'; 
class Authpic extends StatelessWidget {
  const Authpic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        AuthBanner(
          image: 'Group_3_.png',
          title: 'GDG Algiers',
        ),
        Spacer(),
        AuthBanner(
          image: 'Group.png',
          title: 'Women Techmakers \n Algiers',
        ),
      ],
    );
  }
}

class AuthBanner extends StatelessWidget {
  const AuthBanner({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('$images/$image'),
        const SizedBox(width: 10),
        Text(title,
            style: const TextStyle(
                fontSize: 12,
                color: kTextLightColor,
                fontWeight: FontWeight.w400)),
      ],
    );
  }
}

class AuthAnimation extends StatefulWidget {
  const AuthAnimation({
    super.key,
    required this.duration,
    required this.begin,
    required this.end,
    required this.child,
    required this.curve,
    required this.repeat,
  });
  final Duration duration;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final Widget? child;
  final bool repeat;

  @override
  State<AuthAnimation> createState() => _AuthAnimationState();
}

class _AuthAnimationState extends State<AuthAnimation>
    with SingleTickerProviderStateMixin {
  void repeatOnce() async {
    await _firstcontroller.forward();
  }

  late final AnimationController _firstcontroller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: widget.repeat);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(
    parent: _firstcontroller,
    curve: widget.curve,
  ));
  @override
  void initState() {
    if (!widget.repeat) repeatOnce();

    super.initState();
  }

  @override
  void dispose() {
    _firstcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class SVG extends StatelessWidget {
  const SVG({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$images/$image',
    );
  }
}

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key,  this.size = 20});
 final double size ; 

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}
class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double get size => widget.size;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => SizedBox(
          height: size,
          width: size,
          child: CustomPaint(
            painter: CustomCircularLoader(controller: _controller),
          )),
    );
  }
}

class CustomCircularLoader extends CustomPainter {
  CustomCircularLoader({
    required this.controller,
  }) : animation = Tween(begin: 0.0, end: 1.0).animate(controller);

  final AnimationController controller;
  final Animation<double> animation;

  var pi = math.pi;
  var _epsilon = 0.000001;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = SweepGradient(
      // tileMode: TileMode.clamp,
      startAngle: 0,
      endAngle: pi + (2 * pi),
      colors: [
        kBlue,
        kBlue.withOpacity(0.9),
        kBlue.withOpacity(0.8),
        kBlue.withOpacity(0.7),
        kBlue.withOpacity(0.6),
        kBlue.withOpacity(0.5),
        kBlue.withOpacity(0.3),
        kBlue.withOpacity(0.2),
        kBlue.withOpacity(0.2),
        kBlue.withOpacity(0.1),
        Color(0xffEAEFF5),
      ],
      stops: const [
        0.0,
        0.1,
        0.2,
        0.3,
        0.4,
        0.5,
        0.6,
        0.7,
        0.8,
        0.9,
        1.0,
      ],
      transform: GradientRotation(((2 * pi) - _epsilon) * animation.value),
    );
    final backgroundGradient = SweepGradient(
        tileMode: TileMode.decal,
        startAngle: 0,
        endAngle: 2 * pi,
        colors: [
          Color(0xffEAEFF5),
          kBlue.withOpacity(0.1),
          kBlue.withOpacity(0.2),
          kBlue.withOpacity(0.4),
          kBlue.withOpacity(0.5),
          kBlue.withOpacity(0.6),
          kBlue.withOpacity(0.7),
          kBlue.withOpacity(0.8),
          kBlue.withOpacity(0.9),
        ],
        stops: const [
          0.0,
          0.1,
          0.2,
          0.3,
          0.4,
          0.5,
          0.6,
          0.7,
          0.8,
        ],
        transform: GradientRotation(((2 * pi)) * animation.value));
    final backgroundPaint = Paint()
      ..shader = backgroundGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final paint = Paint()
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
      ..color = kBlue
      ..strokeJoin = StrokeJoin.round;
    canvas.drawArc(
      rect,
      0,
      pi * 2,
      false,
      backgroundPaint,
    );
    canvas.drawArc(
      rect,
      animation.value * 2 * pi,
      0.72,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomCircularLoader old) => true;
}

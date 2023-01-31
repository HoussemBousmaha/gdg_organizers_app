import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'dart:math' as math;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: AuthAnimation(
                begin: Offset(0, 2),
                duration: Duration(
                  seconds: 1,
                ),
                end: Offset(0, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'WTM.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: AuthAnimation(
                begin: Offset(0, 2),
                duration: Duration(
                  seconds: 2,
                ),
                end: Offset(0.09, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'Vector 18.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: AuthAnimation(
                begin: Offset(0, -2),
                duration: Duration(seconds: 2, milliseconds: 700),
                end: Offset(-0.09, 0.0),
                curve: Curves.bounceIn,
                child: SVG(
                  image: 'MAKAM.svg',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: AuthAnimation(
                begin: Offset(0, -2),
                duration: Duration(
                  seconds: 4,
                ),
                end: Offset(0, 0.0),
                curve: Curves.bounceInOut,
                child: SVG(
                  image: 'GDG.svg',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: emaillinearGradient),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  hintText: 'Enter your email',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: InputBorder.none),
                            ),
                          ),
                          const Text('Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: passwordlinearGradient),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  hintText: 'Enter your password',
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: InputBorder.none),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Text('Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kTextLightColor,
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(double.infinity, 45),
                                  ),
                                ),
                            onPressed: () {},
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const AuthAnimation(
                      begin: Offset(-2, 0),
                      duration: Duration(
                        seconds: 4,
                      ),
                      end: Offset(0, 0.0),
                      curve: Curves.bounceIn,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                        child: Banner(),
                      ),
                    ),
                    CustomLoader(),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class MasKingGradientTween extends Animatable<SweepGradient> {
  @override
  SweepGradient transform(double t) {
    var pi = math.pi;
    return SweepGradient(
      startAngle: -pi / 2 + (3 * pi / 2 - -pi / 2) * t,
      endAngle: 3 * pi / 2,
      colors: [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
      ],
      stops: [0.0, 0.25, 0.5, 0.75],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
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
  const AuthAnimation(
      {super.key,
      required this.duration,
      required this.begin,
      required this.end,
      required this.child,
      required this.curve});
  final Duration duration;
  final Offset begin;
  final Offset end;
  final Curve curve;
  final Widget? child;

  @override
  State<AuthAnimation> createState() => _AuthAnimationState();
}

class _AuthAnimationState extends State<AuthAnimation>
    with SingleTickerProviderStateMixin {
  void repeatOnce() async {
    await _controller.forward();
  }

  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: widget.begin,
    end: widget.end,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  ));
  @override
  void initState() {
    repeatOnce();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
  const CustomLoader({super.key});

  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: CustomPaint(
        painter: CustomCircularLoader(controller: _controller),
      ),
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
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = SweepGradient(
      tileMode: TileMode.decal,
      startAngle: -20,
      endAngle: 2 * pi,
      colors: const [
        Color(0xffEAEFF5),
        kBlue,
      ],
      stops: const [
        0.2,
        1,
          
      ],
      transform: GradientRotation(2 * pi * animation.value),
    );
    const _epsilon = 0.001;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      rect,
      0,
      pi * 2 * animation.value + _epsilon,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomCircularLoader old) => false;
}

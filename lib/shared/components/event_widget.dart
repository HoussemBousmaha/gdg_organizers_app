import 'package:flutter/material.dart';

import '../const.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        decoration: kBoxDecorationForEvents,
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Container(
            height: 180,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  width: double.infinity,
                  'assets/images/devfest 1.png',
                  fit: BoxFit.fitWidth,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Text(
                        'Coming soon...',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFFCA32),
                        ),
                        onPressed: () {},
                        child: Text(
                          'More Details',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

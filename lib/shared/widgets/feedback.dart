import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gdg_organizers_app/constants/const.dart';

class FeedBackWidget extends StatefulWidget {
  const FeedBackWidget({Key? key}) : super(key: key);

  @override
  State<FeedBackWidget> createState() => _FeedBackWidgetState();
}

class _FeedBackWidgetState extends State<FeedBackWidget> {
  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: kBoxDecorationForTask,
        child: Container(
          margin: const EdgeInsets.all(2),
          height: 360,
          width: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8,
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Rate : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kBlue,
                        ),
                      ),
                      RatingStars(
                        value: value,
                        onValueChanged: (v) {
                          setState(() {
                            value = v;
                          });
                        },
                        starBuilder: (index, color) => Icon(
                          Icons.star,
                          color: color,
                        ),
                        starCount: 5,
                        starSize: 20,
                        valueLabelColor: const Color(0xff9b9b9b),
                        valueLabelRadius: 10,
                        maxValue: 5,
                        starSpacing: 2,
                        maxValueVisibility: true,
                        valueLabelVisibility: false,
                        animationDuration: const Duration(milliseconds: 500),
                        valueLabelPadding: const EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 8,
                        ),
                        valueLabelMargin: const EdgeInsets.only(right: 8),
                        starOffColor: const Color(0xffe7e8ea),
                        starColor: Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Feedback : ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kBlue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,
                          decoration: const InputDecoration(
                            hintText: 'Description of the feedback ...',
                            fillColor: Colors.red,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: kBlue,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: kBlue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: kBlue,
                            ),
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
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
      ),
    );
  }
}

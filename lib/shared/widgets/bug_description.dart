import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/constants/const.dart';

class BugDescription extends StatelessWidget {
  const BugDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationForTask,
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 330,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bug Description : ',
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
                          hintText: 'Description of the bug ...',
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
    );
  }
}

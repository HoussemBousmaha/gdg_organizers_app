import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/constants/const.dart';

class SettingButton extends StatelessWidget {
  const SettingButton(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric( vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: kBlue,
                width: 1,
              )),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ));
  }
}


class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const  [
           Text(
            'User name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
           Text('Role',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: kRed)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/constants/icon_broken.dart';
import 'package:gdg_organizers_app/features/settings/widgets/settings_widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserInfo(),
          const SizedBox(
            height: 20,
          ),
          const Text('GENERAL',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: kBlue)),
          SettingButton(
              text: 'Account',
              icon: IconBroken.Profile,
              onPressed: () {
                Navigator.pushNamed(context, '/editprofile');
              }),
          SettingButton(text: 'Log out', icon: Icons.logout, onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          const Text('FEEDBACK',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: kBlue)),
          SettingButton(
              text: 'Report a bug', icon: IconBroken.Search, onPressed: () {}),
          SettingButton(
              text: 'Send a Feedback',
              icon: IconBroken.Message,
              onPressed: () {}),
        ],
      ),
    );
  }
}

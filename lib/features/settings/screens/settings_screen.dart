import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/constants/icon_broken.dart';
import 'package:gdg_organizers_app/features/settings/screens/editprofilescreen.dart';
import 'package:gdg_organizers_app/features/settings/widgets/settings_widgets.dart';
import 'package:gdg_organizers_app/logic/user_bloc/user_bloc.dart';
import 'package:gdg_organizers_app/shared/widgets/feedback.dart';
import 'package:gdg_organizers_app/shared/widgets/logout_pop_up.dart';

import '../../../logic/togglecubit.dart';
import '../../../shared/widgets/bug_description.dart';

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
          SettingButton(
              text: 'Update Password',
              icon: IconBroken.Password,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: UpdatePassword(),
                    );
                  },
                );
              }),
          SettingButton(
              text: 'Log out',
              icon: Icons.logout,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: LogoutPopUp(),
                    );
                  },
                );
              }),
          const SizedBox(
            height: 10,
          ),
          const Text('FEEDBACK',
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: kBlue)),
          SettingButton(
              text: 'Report a bug',
              icon: IconBroken.Search,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: BugDescription(),
                    );
                  },
                );
              }),
          SettingButton(
              text: 'Send a Feedback',
              icon: IconBroken.Message,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: FeedBackWidget(),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}

class UpdatePassword extends StatefulWidget {
  UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

late TextEditingController _currentPasswordController;

class _UpdatePasswordState extends State<UpdatePassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {};
  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Update Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter your current password and a new password to update your password',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordTextField(
                    hintText: 'Current Password',
                    mapKey: 'currentPassword',
                    data: data,
                    validator: validatePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocProvider(
                    create: (context) => ToggelCubit(),
                    child: BlocBuilder<ToggelCubit, bool>(
                      builder: (context, state) {
                        return TextFormField(
                          autocorrect: false,
                          obscureText: !state,
                          controller: _currentPasswordController,
                          onSaved: (newValue) =>
                              data['newpassword'] = newValue!,
                          validator: validatePassword,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            hintText: 'New Password',
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(state
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                context.read<ToggelCubit>().toggle();
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocProvider(
                    create: (context) => ToggelCubit(),
                    child: BlocBuilder<ToggelCubit, bool>(
                      builder: (context, state) {
                        return TextFormField(
                          autocorrect: false,
                          obscureText: !state,
                          validator: (value) {
                            if (value != _currentPasswordController.text) {
                              return 'passwords do not match';
                            }
                            return null;
                          },
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            hintText: 'confirm Password',
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(state
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                context.read<ToggelCubit>().toggle();
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<UserBloc>().add(
                                UserEvent.updateUserPassword(
                                    data['password'],
                                    data['newpassword']));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: kBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}

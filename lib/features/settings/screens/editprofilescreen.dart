import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/settings/widgets/settings_widgets.dart';
import 'package:gdg_organizers_app/shared/widgets/customappbar.dart';

import '../../../logic/togglecubit.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppBar(
          currentIndex: 4,
          title: 'Settings',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserInfo(),
                const TextFieldTitle(title: 'First Name'),
                const EditUserTextField(
                  initialValue: 'Moussaab',
                  keyboardType: TextInputType.name,
                ),
                const TextFieldTitle(title: 'Last Name'),
                const EditUserTextField(
                  initialValue: 'Badla',
                  keyboardType: TextInputType.name,
                ),
                const TextFieldTitle(title: 'Email'),
                const EditUserTextField(
                  initialValue: 'badlamoussaab@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                const TextFieldTitle(title: 'Phone'),
                const EditUserTextField(
                  initialValue: '06897987879',
                  keyboardType: TextInputType.phone,
                ),
                const TextFieldTitle(title: 'Password'),
                const PasswordTextField(
                  initialValue: '123456789',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kBlue),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
    );
  }
}

class EditUserTextField extends StatelessWidget {
  const EditUserTextField(
      {super.key, required this.initialValue, required this.keyboardType});
  final String initialValue;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autocorrect: false,
      keyboardType: keyboardType,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.initialValue});
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit(),
      child: BlocBuilder<ToggelCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            autocorrect: false,
            obscureText: state,
            initialValue: initialValue,
            enableSuggestions: false,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: IconButton(
                icon: Icon(state ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  context.read<ToggelCubit>().toggle();
                },
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          );
        },
      ),
    );
  }
}

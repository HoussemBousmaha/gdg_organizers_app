import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/settings/widgets/settings_widgets.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/shared/widgets/customappbar.dart';
import 'package:gdg_organizers_app/shared/widgets/logout_pop_up.dart';

import '../../../logic/togglecubit.dart';
import '../../../logic/user_bloc/user_bloc.dart';
import '../../../shared/widgets/gdgLogo.dart';
import '../../../shared/widgets/loading.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = '/editprofile';

  EditProfile({super.key});

  Map<String, dynamic> data = {};
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: CustomAppBar(
              currentIndex: 4,
              title: 'Settings',
              showBackButton: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UserInfo(),
                      const TextFieldTitle(
                        title: 'First Name',
                      ),
                      EditUserTextField(
                        initialValue: context.watch<AuthBloc>().user.firstname,
                        keyboardType: TextInputType.name,
                        data: data,
                        validator: (p0) =>
                            p0!.isEmpty ? 'Please enter your first name' : null,
                        mapKey: 'firstname',
                      ),
                      const TextFieldTitle(title: 'Last Name'),
                      EditUserTextField(
                        initialValue: context.watch<AuthBloc>().user.lastname,
                        keyboardType: TextInputType.name,
                        data: data,
                        validator: (p0) =>
                            p0!.isEmpty ? 'Please enter your last name' : null,
                        mapKey: 'lastname',
                      ),
                      const TextFieldTitle(title: 'Email'),
                      EditUserTextField(
                        initialValue: context.watch<AuthBloc>().user.email,
                        keyboardType: TextInputType.emailAddress,
                        data: data,
                        validator: validateEmail,
                        mapKey: 'email',
                      ),
                      const TextFieldTitle(title: 'Phone'),
                      EditUserTextField(
                        initialValue: context.watch<AuthBloc>().user.phone,
                        keyboardType: TextInputType.phone,
                        data: data,
                        validator: (p0) => p0!.isEmpty && p0.length < 8
                            ? 'Please enter your phone number'
                            : null,
                        mapKey: 'phone',
                      ),
                      const TextFieldTitle(title: 'Password'),
                      PasswordTextField(
                        hintText: 'Enter your password',
                        mapKey: 'password',
                        data: data,
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context
                                .read<UserBloc>()
                                .add(UserEvent.updateUser(data));
                          }
                        },
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
              ),
            )),
        BlocBuilder<UserBloc, UserState>(
            builder: (context, state) => state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loading: (value) => const Loading(),
                ))
      ],
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    super.key,
    required this.title,
    this.padding = 6,
  });
  final String title;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Text(title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
    );
  }
}

class EditUserTextField extends StatelessWidget {
  const EditUserTextField(
      {super.key,
      this.initialValue,
      required this.keyboardType,
      this.data,
      this.validator,
      this.mapKey,
      this.hintText});
  final String? initialValue;
  final String? hintText;
  final TextInputType keyboardType;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autocorrect: false,
      validator: validator,
      onSaved: (newValue) => data![mapKey!] = newValue!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 5),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      this.initialValue,
      this.data,
      this.validator,
      this.mapKey,
      this.hintText});
  final String? initialValue;
  final String? hintText;
  final Map<String, dynamic>? data;
  final String? Function(String?)? validator;
  final String? mapKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggelCubit(),
      child: BlocBuilder<ToggelCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            autocorrect: false,
            obscureText: !state,
            initialValue: initialValue,
            onSaved: (newValue) => data!['password'] = newValue!,
            validator: validatePassword,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: hintText,
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

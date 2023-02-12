import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/const.dart';
import '../../settings/screens/editprofilescreen.dart';
import '../login_bloc/login_bloc.dart';
import '../widgets/authwidgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Map<String, String> loginData = {};
  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  void login() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<LoginBloc>().add(LoginEvent.login(email: loginData['email']!, password: loginData['password']!));
    }
  }

  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: AuthAnimation(
                  repeat: false,
                  begin: Offset(0, 2),
                  duration: Duration(
                    seconds: 1,
                    milliseconds: 500,
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
                  repeat: false,
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
                  repeat: false,
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
                  repeat: false,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextFieldTitle(
                                title: 'Email',
                              ),
                              EditUserTextField(
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                                hintText: 'Enter your email',
                                data: loginData,
                                mapKey: 'email',
                              ),
                              const TextFieldTitle(
                                title: 'Password',
                              ),
                              PasswordTextField(
                                hintText: 'Enter your password',
                                data: loginData,
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
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return state.when(
                                    loading: () => const Center(child: CustomLoader()),
                                    initial: () => LoginButton(
                                      onPressed: () => login(),
                                    ),
                                    success: () => LoginButton(
                                      onPressed: () => login(),
                                    ),
                                    failure: (error) => LoginButton(
                                      onPressed: () => login(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const AuthAnimation(
                          repeat: false,
                          begin: Offset(-2, 0),
                          duration: Duration(
                            seconds: 4,
                          ),
                          end: Offset(0, 0.0),
                          curve: Curves.bounceIn,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                            child: Authpic(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 45),
            ),
          ),
      onPressed: onPressed,
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

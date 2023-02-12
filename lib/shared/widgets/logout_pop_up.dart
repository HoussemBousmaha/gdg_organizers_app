import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/const.dart';
import '../../logic/auth_bloc/auth_bloc.dart';

class LogoutPopUp extends StatelessWidget {
  const LogoutPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: 120,
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Text('You want logout ?', style: TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  style: TextButton.styleFrom(
                    backgroundColor: kRed,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 50),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<AuthBloc>().add(const AuthEvent.loggedOut());
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    backgroundColor: kGreen,
                  ),
                  child: const Text('Confirm', style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SuccessPopup extends StatelessWidget {
  const SuccessPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 120,
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: const [
            Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.check_circle_outline,
              color: kGreen,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: 120,
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              error,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.error_outline, color: kRed, size: 50),
          ],
        ),
      ),
    );
  }
}

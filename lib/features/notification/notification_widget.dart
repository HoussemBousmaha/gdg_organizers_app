import 'package:flutter/material.dart';

import '../../constants/const.dart';

class NotificationWidget extends StatelessWidget {
  //const NotificationWidget({Key? key}) : super(key: key);

  final AppNotification notification;
  const NotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        decoration: kBoxDecorationForTask,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 197, 196, 196),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(right: 8.0)),
                Icon(notification.icon),
                const Padding(padding: EdgeInsets.only(right: 25.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppNotification {
  final String title;
  final String message;
  final IconData icon;

  AppNotification({required this.title, required this.message, required this.icon});
}

class EventNotification extends AppNotification {
  EventNotification({required String title, required String message, required IconData icon}) : super(title: title, message: message, icon: icon);
}

class TaskNotification extends AppNotification {
  TaskNotification({required String title, required String message, required IconData icon}) : super(title: title, message: message, icon: icon);
}

class BadgeNotification extends AppNotification {
  BadgeNotification({required String title, required String message, required IconData icon}) : super(title: title, message: message, icon: icon);
}

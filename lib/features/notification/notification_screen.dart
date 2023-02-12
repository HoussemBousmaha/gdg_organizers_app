import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../constants/icon_broken.dart';
import 'notification_widget.dart';

class Notifications extends StatefulWidget {
  static const String routeName = "/notifications";

  const Notifications({super.key});
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<AppNotification> _notifications = [];

  @override
  void initState() {
    super.initState();

    addTaskNotification("New Task", "A new task has been assigned to you.");
    addEventNotification("New Event", "A new event has been added.");
    addTaskNotification("New Task", "A new task has been assigned to you.");
    addBadgeNotification("New Badge", "You have earned a new badge.");
  }

  void addEventNotification(String title, String message) {
    EventNotification notification = EventNotification(title: title, message: message, icon: IconBroken.Calendar);
    setState(() {
      _notifications.add(notification);
    });
  }

  void addTaskNotification(String title, String message) {
    TaskNotification notification = TaskNotification(title: title, message: message, icon: IconBroken.Tick_Square);
    setState(() {
      _notifications.add(notification);
    });
  }

  void addBadgeNotification(String title, String message) {
    BadgeNotification notification = BadgeNotification(title: title, message: message, icon: Icons.star);
    setState(() {
      _notifications.add(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 129, 250),
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 11, 10, 8),
            child: LiteRollingSwitch(
              animationDuration: const Duration(milliseconds: 200),
              width: 70,
              value: true,
              textOn: "",
              textOff: "",
              colorOn: Colors.greenAccent,
              colorOff: Colors.redAccent,
              iconOn: Icons.notifications_on,
              iconOff: Icons.notifications_off,
              textSize: 12.0,
              onTap: () {},
              onSwipe: () {},
              onDoubleTap: () {},
              onChanged: (bool position) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        margin: const EdgeInsets.fromLTRB(15, 20, 15, 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  top: 10,
                ),
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: Color(0xFF4285F4),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(notification: _notifications[index]);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  top: 10,
                ),
                child: Text(
                  'Yesterday',
                  style: TextStyle(
                    color: Color(0xFF4285F4),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _notifications.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(notification: _notifications[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

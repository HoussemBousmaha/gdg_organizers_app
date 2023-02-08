import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/features/auth/widgets/authwidgets.dart';
import 'package:gdg_organizers_app/features/events/cubit/event_cubit.dart';
import 'package:gdg_organizers_app/features/home/home_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/const.dart';
part 'widgets/event_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 15,
            ),
            child: Text(
              'Coming Soon',
              style: TextStyle(
                color: Color(0xFF4285F4),
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 15),
          BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => Column(
                        children:
                            List.generate(4, (index) => const EventShimmer()),
                      ),
                  loaded: (_, soonEvents) => Column(
                      children: soonEvents
                          .map((e) => EventWidget(
                                image: e.image,
                                state: e.state!,
                              ))
                          .toList()),
                  error: (e) => Center(child: Text(e)));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 15,
            ),
            child: Text(
              'New Events',
              style: TextStyle(
                color: Color(0xFF4285F4),
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
          BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              return state.when(
                  initial: () => const SizedBox(),
                  loading: () => Column(
                        children:
                            List.generate(4, (index) => const EventShimmer()),
                      ),
                  loaded: (newEvents, _) => Column(
                      children: newEvents
                          .map((e) => EventWidget(
                                image: e.image,
                                state: e.state!,
                              ))
                          .toList()),
                  error: (e) => Center(child: Text(e)));
            },
          ),
        ],
      ),
    );
  }
}

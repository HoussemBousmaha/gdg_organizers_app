part of '../events_screen.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationForEvents,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: const EdgeInsets.all(2.5),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: event.image,
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomImage(
                  uri: event.image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    event.state!,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCA32),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        EventsDetails.routeName,
                        arguments: event,
                      );
                    },
                    child: const Text(
                      'More Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EventShimmer extends StatelessWidget {
  const EventShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 180,
        color: Colors.white,
      ),
    );
  }
}

part of '../events_screen.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({Key? key, required this.state, required this.image})
      : super(key: key);
  final String image;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationForEvents,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        margin: const EdgeInsets.all(2.5),
        height: 180,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImage(
              uri: image,
              imageBuilder: (context, imageProvider) => Image.network(
                image,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 120,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Text(
                    state,
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
                    onPressed: () {},
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

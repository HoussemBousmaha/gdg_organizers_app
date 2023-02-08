part of '../home_screen.dart';

class PostWidget extends StatelessWidget {
  const PostWidget(
      {super.key,
      required this.name,
      required this.time,
      required this.desc,
      required this.image,
      required this.profileImage});
  final String name;
  final String time;
  final String desc;
  final String image;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGrey.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          Row(
            children: [
              CustomImage(
                uri: profileImage,
                imageBuilder: (context, imageProvider) => Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      time,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 54, 54, 50),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomImage(
            uri: image,
            imageBuilder: (context, imageProvider) => Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

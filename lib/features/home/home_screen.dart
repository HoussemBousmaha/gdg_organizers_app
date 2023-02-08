import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/features/auth/widgets/authwidgets.dart';
import 'package:advanced_search/advanced_search.dart';

import '../../constants/const.dart';
part 'widgets/post.dart';
part 'widgets/searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: searchBar(),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              top: 18,
            ),
            child: Text(
              "Actualities",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Column(
            children: posts
                .map((e) => PostWidget(
                      name: e.name,
                      time: e.time,
                      desc: e.desc,
                      image: e.image,
                      profileImage: e.profileImage,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

List<PostWidget> posts = [
  const PostWidget(
    name: 'GDG Algiers ',
    time: "2h",
    desc:
        'GDG Algiers is a community of developers who are interested in Google technologies. We are a group of developers who are passionate about Google technologies and want to share our knowledge with the community',
    image:
        "https://developers.google.com/community/devfest/images/devfest-social.png",
    profileImage: 'https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg',
  ),
  const PostWidget(
    name: 'GDG Algiers ',
    time: "2h",
    desc:
        'GDG Algiers is a community of developers who are interested in Google technologies. We are a group of developers who are passionate about Google technologies and want to share our knowledge with the community',
    image:
        "https://developers.google.com/community/devfest/images/devfest-social.png",
    profileImage: 'https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg',
  ),
  const PostWidget(
    name: 'GDG Algiers ',
    time: "2h",
    desc:
        'GDG Algiers is a community of developers who are interested in Google technologies. We are a group of developers who are passionate about Google technologies and want to share our knowledge with the community',
    image:
        "https://developers.google.com/community/devfest/images/devfest-social.png",
    profileImage: 'https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg',
  ),
  const PostWidget(
    name: 'GDG Algiers ',
    time: "2h",
    desc:
        'GDG Algiers is a community of developers who are interested in Google technologies. We are a group of developers who are passionate about Google technologies and want to share our knowledge with the community',
    image:
        "https://developers.google.com/community/devfest/images/devfest-social.png",
    profileImage: 'https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg',
  ),
  const PostWidget(
    name: 'GDG Algiers ',
    time: "2h",
    desc:
        'GDG Algiers is a community of developers who are interested in Google technologies. We are a group of developers who are passionate about Google technologies and want to share our knowledge with the community',
    image:
        "https://developers.google.com/community/devfest/images/devfest-social.png",
    profileImage: 'https://pbs.twimg.com/media/D22N_huX4AEbb1y.jpg',
  ),
];

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.uri, this.imageBuilder});
  final String uri;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: uri,
      imageBuilder: imageBuilder,
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
      progressIndicatorBuilder: (context, url, progress) =>
          const Center(child: CustomLoader()),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      readOnly: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Color(0xff849395)),
          filled: true,
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xff849395),
          ),
          fillColor: Color(0xffF4F8F9)),
    );
  }
}

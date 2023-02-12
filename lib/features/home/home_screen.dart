import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/widgets/authwidgets.dart';
import 'package:advanced_search/advanced_search.dart';
import 'post_cubit/posts_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/const.dart';
part 'widgets/post.dart';
part 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostsCubit>().getPosts();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: SearchBar(),
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
            BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => Column(
                          children: List.generate(
                            3,
                            (index) => const PostShimmer(),
                          ),
                        ),
                    loaded: (posts) => Column(
                          children: posts
                              .map((e) => PostWidget(
                                    name: e.fullName,
                                    time: e.messagetime,
                                    desc: e.body,
                                    image: e.photo!,
                                    profileImage: e.postedBy!.image!,
                                  ))
                              .toList(),
                        ),
                    error: (e) => Center(child: Text(e)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.uri, this.imageBuilder});
  final String uri;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: uri,
      imageBuilder: imageBuilder,
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
      progressIndicatorBuilder: (context, url, progress) => const Center(child: CustomLoader()),
    );
  }
}

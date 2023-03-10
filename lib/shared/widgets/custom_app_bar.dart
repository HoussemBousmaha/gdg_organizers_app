import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/const.dart';
import '../../constants/icon_broken.dart';
import '../../features/notification/notification_screen.dart';
import '../../features/settings/widgets/profile_avatar.dart';
import '../../logic/auth_bloc/auth_bloc.dart';
import '../../logic/imagecubit.dart';
import '../../logic/user_bloc/user_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, required this.currentIndex, this.showBackButton = false});
  final String title;
  final int currentIndex;
  final bool showBackButton;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: currentIndex > 2 ? CustomShape() : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: currentIndex > 2 ? kBlue : Colors.white,
          ),
        ),
        SafeArea(
          child: Row(
            children: [
              if (currentIndex < 4)
                SizedBox(
                  width: currentIndex > 2
                      ? 45
                      : showBackButton
                          ? 0
                          : 20,
                  height: 60,
                ),
              if (showBackButton)
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      IconBroken.Arrow___Left_2,
                      color: currentIndex > 2 ? Colors.white : Colors.black,
                    )),
              if (currentIndex > 2) const Spacer(),
              Text(
                title,
                style: TextStyle(
                  color: currentIndex > 2 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Notifications.routeName);
                  },
                  icon: Icon(
                    Iconsax.notification,
                    color: currentIndex > 2 ? Colors.white : kBlue,
                  )),
              if (currentIndex < 3)
                const SizedBox(
                  width: 40,
                )
            ],
          ),
        ),
        SafeArea(
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            alignment: currentIndex < 3 ? Alignment.topRight : Alignment.bottomCenter,
            child: CoverPhoto(
              coverPhotoUrl: context.watch<AuthBloc>().user.image!,
              showCoverPhotoOptions: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocBuilder<ImageCubit, XFile?>(
                      builder: (context, state) {
                        return AlertDialog(
                          contentPadding: const EdgeInsets.all(0),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (context.read<ImageCubit>().state != null)
                                Container(
                                  margin: const EdgeInsets.all(20),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: kBlue,
                                      width: 4,
                                    ),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(context.read<ImageCubit>().state!.path),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (context.read<ImageCubit>().state == null)
                                CachedNetworkImage(
                                  imageUrl: context.watch<AuthBloc>().user.image!,
                                  imageBuilder: (context, imageProvider) => Container(
                                    margin: const EdgeInsets.all(20),
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: kBlue,
                                        width: 4,
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ListTile(
                                onTap: () async {
                                  _picker.pickImage(source: ImageSource.camera).then((value) => context.read<ImageCubit>().changeCoverPhoto(value));
                                },
                                leading: const Icon(IconBroken.Camera),
                                title: const Text(
                                  'Camera',
                                ),
                              ),
                              ListTile(
                                onTap: () async {
                                  _picker.pickImage(source: ImageSource.gallery).then((value) => context.read<ImageCubit>().changeCoverPhoto(value));
                                },
                                leading: const Icon(IconBroken.Image),
                                title: const Text('Gallery'),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        context.read<ImageCubit>().clear();
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: kRed),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () async {
                                          if (state != null) {
                                            context.read<UserBloc>().add(UserEvent.updateUserImage(
                                                  state.path,
                                                ));
                                            context.read<ImageCubit>().clear();
                                          }
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Done',
                                          style: TextStyle(color: kBlue),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              showBackButton: currentIndex > 2,
              hideEditButton: currentIndex < 4,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(currentIndex > 2 ? 200 : 60);
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height, width, height - 80);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ChooseImage extends StatelessWidget {
  const ChooseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: const [],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_organizers_app/constants/const.dart';
import 'package:gdg_organizers_app/features/auth/widgets/authwidgets.dart';
import 'package:gdg_organizers_app/features/home/home_screen.dart';
import 'package:gdg_organizers_app/logic/auth_bloc/auth_bloc.dart';
import 'package:gdg_organizers_app/logic/comment_bloc/comment_bloc.dart';
import 'package:gdg_organizers_app/shared/widgets/customAppBar.dart';
import 'package:intl/intl.dart';

import '../../../models/comments/comment.dart';
import '../../../shared/services/socket_io.dart';
import '../models/event.dart';

class EventsDetails extends StatefulWidget {
  static const String routeName = '/eventsDetails';

  const EventsDetails({Key? key}) : super(key: key);
  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late final Event event;
  late final CommentBloc commentBloc;

  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    commentBloc = context.read<CommentBloc>();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    event = ModalRoute.of(context)!.settings.arguments as Event;
    context.read<CommentBloc>().add(CommentEvent.connect(
        context.watch<AuthBloc>().user.id ?? '',
        event.id ?? '',
        event.comments ?? []));

    commentBloc.comments = event.comments ?? [];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'EventDetails',
        currentIndex: 0,
        showBackButton: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: event.image,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CustomImage(
                    uri: event.image,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            key: const ValueKey('Description'),
            sliver: SliverToBoxAdapter(
              child: Header(event: event),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            key: const ValueKey('Galory'),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                  height: 175,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return CustomImage(
                            uri: event.image,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                width: 175,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.contain),
                                    color: Colors.white),
                              );
                            });
                      })),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Comments',
                style: TextStyle(
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
                child: BlocConsumer<CommentBloc, CommentState>(
                    listener: (context, state) => {
                          state.maybeWhen(
                              newComment: (comments) {
                                textEditingController.clear();
                                focusNode.unfocus();
                              },
                              orElse: () {})
                        },
                    builder: (context, state) {
                      return state.when(
                          initial: () => const SizedBox.shrink(),
                          failure: (value) => Text(value),
                          loading: () => const Center(
                                child: CustomLoader(),
                              ),
                          success: (value) => Column(
                                children: value
                                    .map((e) => CommentWidget(comment: e))
                                    .toList(),
                              ),
                          newComment: (List<Comment> comments) => Column(
                                children: comments
                                    .map((e) => CommentWidget(comment: e))
                                    .toList(),
                              ));
                    })),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          )
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: TextFormField(
          focusNode: focusNode,
          controller: textEditingController,
          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              return;
            } else {
              context
                  .read<CommentBloc>()
                  .add(CommentEvent.sendComment(textEditingController.text));
            }
          },
          decoration: InputDecoration(
              hintText: 'Write a comment',
              suffixIcon: IconButton(
                  onPressed: () {
                    if (textEditingController.text.isEmpty) {
                      focusNode.unfocus();

                      return;
                    } else {
                      focusNode.unfocus();

                      context.read<CommentBloc>().add(
                          CommentEvent.sendComment(textEditingController.text));
                      textEditingController.clear();
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
              border: InputBorder.none),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 35,
        ),
        const Text(
          'Description',
          style: TextStyle(
            color: Color(0xFF4285F4),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(event.description),
        const SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(
                style: const TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                text: 'Date   ',
                children: [
              TextSpan(
                  text: '   ${event.datedebut}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal))
            ])),
        const SizedBox(
          height: 20,
        ),
        RichText(
            text: TextSpan(
                style: const TextStyle(
                  color: Color(0xFF4285F4),
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
                text: 'Status   ',
                children: [
              TextSpan(
                  text: '   ${event.state}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal))
            ])),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Galory',
          style: TextStyle(
            color: Color(0xFF4285F4),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            uri: context.watch<AuthBloc>().user.image!,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage(context.watch<AuthBloc>().user.image!),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.sender!.firstname + ' ' + comment.sender!.lastname,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(comment.createdAt!),
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  comment.content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 22,
                endIndent: 22,
              ),
            ],
          )
        ],
      ),
    );
  }
}









// Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 35,
//               ),
//               const Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 22),
//                 child: Text(
//                   'Description',
//                   style: TextStyle(
//                     color: Color(0xFF4285F4),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 22),
//                 child: Text(event.description),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 22),
//                   child: RichText(
//                       text: TextSpan(
//                           style: const TextStyle(
//                             color: kBlue,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 17,
//                           ),
//                           text: 'Date   ',
//                           children: [
//                         TextSpan(
//                             text: '   ${event.datedebut}',
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.normal))
//                       ]))),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 22),
//                   child: RichText(
//                       text: TextSpan(
//                           style: const TextStyle(
//                             color: Color(0xFF4285F4),
//                             fontWeight: FontWeight.w700,
//                             fontSize: 17,
//                           ),
//                           text: 'Status   ',
//                           children: [
//                         TextSpan(
//                             text: '   ${event.state}',
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.normal))
//                       ]))),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 22),
//                 child: Text(
//                   'Galory',
//                   style: TextStyle(
//                     color: Color(0xFF4285F4),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               SizedBox(
//                   height: 175,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: 6,
//                       itemBuilder: (context, index) {
//                         return CustomImage(
//                             uri: event.image,
//                             imageBuilder: (context, imageProvider) {
//                               return Container(
//                                 margin:
//                                     const EdgeInsets.symmetric(horizontal: 7),
//                                 width: 175,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     image: DecorationImage(
//                                         image: imageProvider,
//                                         fit: BoxFit.contain),
//                                     color: Colors.white),
//                               );
//                             });
//                       })),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 22),
//                 child: Text(
//                   'Comments ',
//                   style: TextStyle(
//                     color: Color(0xFF4285F4),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 17,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Container(
//                   color: kLightGrey,
//                   margin: const EdgeInsets.symmetric(horizontal: 22),
//                   child: ListView.separated(
//                       itemCount: 6,
//                       itemBuilder: (context, index) {
//                         return const CommentWidget();
//                       },
//                       separatorBuilder: (context, index) => const Divider(
//                             color: Colors.grey,
//                             thickness: 1,
//                             indent: 22,
//                             endIndent: 22,
//                           ))),
//             ],
//           )
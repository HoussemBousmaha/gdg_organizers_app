import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../../../models/user/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  const factory Post({
    required String body,
    String? title,
    User? postedBy,
    String? photo,
    String? id,
    String? createdAt,
    String? password,
  }) = _Post;
  String get fullName => '${postedBy!.firstname} ${postedBy!.lastname}';

  String get messagetime {
    final now = DateTime.now();

    final timestamp = DateTime.parse(createdAt!).toLocal();
    final format = DateFormat('HH:mm a');
    final diff = now.difference(timestamp);
    String time = '';

    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0) {
      time = 'JUST NOW';
    } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
      if (diff.inMinutes == 1) {
        time = '${diff.inMinutes}m ago';
      } else {
        time = '${diff.inMinutes}m ago';
      }
    } else if (diff.inHours > 0 && diff.inHours < 24) {
      if (diff.inHours == 1) {
        time = '${diff.inHours}h ago';
      } else {
        time = '${diff.inHours}h ago';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays}d ago';
      } else {
        time = '${diff.inDays}d ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()}w ago';
      } else {
        time = '${(diff.inDays / 7).floor()}w ago';
      }
    }

    return time;
  }

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

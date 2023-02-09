import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/const.dart';

class WebSocketServices {
  static late IO.Socket socket;
  static void connect([String id = '', String channel = '']) {
    socket = IO.io('$socketUri?userID=$id', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': {'foo': 'bar'}
    })
      ..connect();
  }
}

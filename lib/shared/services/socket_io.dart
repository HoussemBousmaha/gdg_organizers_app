import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/const.dart';



class Webscoketservices {
 static  IO.Socket socket  = IO.io(uri) ;
  
 static void connect([String id = '' , String channel = '']){
    socket =   IO.io('$uri?userID=$id?channelID=$channel',<String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      });
       socket.connect();

  }


}
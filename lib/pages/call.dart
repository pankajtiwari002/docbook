import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CallPage extends StatefulWidget {
  final String? channelName;
  final ClientRoleType? role;

  CallPage({this.channelName, this.role});
  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('agora'),
        centerTitle: true,
      ),
    );
  }
}

// import 'dart:async';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';

// import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
// import '../utils/settings.dart';

// class CallPage extends StatefulWidget {
//   final String? channelName;
//   final ClientRoleType? role;

//   CallPage({this.channelName, this.role});
//   @override
//   State<CallPage> createState() => _CallPageState();
// }

// class _CallPageState extends State<CallPage> {
//   final _user = <int>[];
//   final _infoString = <String>[];
//   bool muted = false;
//   bool viewPanel = false;
//   late RtcEngine _engine;
//   @override
//   void initstate() {
//     super.initState();
//     initialize();
//   }

//   @override
//   void dispose() {
//     _user.clear();
//     _engine.leaveChannel();
//     // _engine.destroy();
//     super.dispose();
//   }

//   Future<void> initialize() async {
//     if (appId.isEmpty) {
//       setState(() {
//         _infoString.add('App id is missind , please provide ');
//         _infoString.add('agora engine is not starting');
//       });
//       return;
//     } //!=initagoraRtcEngine
//     _engine = await RtcEngine.create(appId);
//     await _engine.enableVideo();
//     await _engine
//         .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
//     await _engine.setClientRole(widget.role!);
//     _addAgoraEventHandler();
//     VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
//     configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
//     await _engine.setVideoEncoderConfiguration(configuration);
//     await _engine.joinChannel(token, channelId: channelId, uid: uid, options: options)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('agora'),
//         centerTitle: true,
//       ),
//     );
//   }
// }
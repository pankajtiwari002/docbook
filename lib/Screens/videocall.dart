// import 'package:docbook/constant.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// class VideoCall extends StatefulWidget {
//   const VideoCall({super.key});

//   @override
//   State<VideoCall> createState() => _VideoCallState();
// }

// class _VideoCallState extends State<VideoCall> {
//   final String callID;
//   @override
//   Widget build(BuildContext context) {
//    return ZegoUIKitPrebuiltCallWithInvitation(
//       appID: MyConstant.appID,
//       appSign: MyConstant.appSign,
//       userID: userID,
//       userName: userName,
//       notifyWhenAppRunningInBackgroundOrQuit: true,
//       isIOSSandboxEnvironment: false,
//       androidNotificationConfig: ZegoAndroidNotificationConfig(
//             channelID: "ZegoUIKit", //  FCM Channel ID in ZEGOCLOUD Admin Console
//             channelName: "Call Notifications",
//             sound: "zego_incoming", //  FCM Sound File Name ID in ZEGOCLOUD Admin Console
//       ),
//       plugins: [ZegoUIKitSignalingPlugin()],
//       child: ,
//    );
//   }
// }
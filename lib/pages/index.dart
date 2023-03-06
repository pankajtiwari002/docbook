import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRoleType? _role = ClientRoleType.clientRoleBroadcaster;
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text('Video Call'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.network(
                'https://ouch-cdn2.icons8.com/-JtIiq5_DKMilzqYXLsv62Vfs60MFq1pSX68vEzcba8/rs:fit:256:271/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjc1/LzQ5YzE1MjMxLTQ1/MmEtNGFjMi1iMmEy/LWI4MTY3N2ZiOWY4/Mi5wbmc.png'),
            SizedBox(height: 20),
            TextField(
              controller: _channelController,
              decoration: InputDecoration(
                errorText: _validateError ? ' Doctor name is mandatory' : null,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
                hintText: 'Doctor name',
              ),
            ),
            RadioListTile(
              title: Text('Doctor'),
              onChanged: (ClientRoleType? value) {
                setState(() {
                  _role = value;
                });
              },
              value: ClientRoleType.clientRoleBroadcaster,
              groupValue: _role,
            ),
            RadioListTile(
              title: Text('User'),
              onChanged: (ClientRoleType? Value) {
                setState(() {
                  _role = Value;
                });
              },
              value: ClientRoleType.clientRoleAudience,
              groupValue: _role,
            ),
            ElevatedButton(
              onPressed: onJoin,
              child: Text('Join'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 22, 18, 241),
                  minimumSize: const Size(double.infinity, 40)),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CallPage(
                    channelName: _channelController.text,
                    role: _role,
                  )));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }
}
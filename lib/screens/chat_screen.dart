import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'doctor_profile.dart';

class ChatScreen extends StatefulWidget {
  final String doctorName;
  const ChatScreen({super.key, required this.doctorName});

  @override
  State<ChatScreen> createState() => _ChatStateScreen();
}

class _ChatStateScreen extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DoctorProfile(doctorName: widget.doctorName)));
            },
            child: Text(widget.doctorName)),
        centerTitle: true,
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "123",
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}

import 'package:flutter/material.dart';

class MessageScreenView extends StatefulWidget {
  const MessageScreenView({super.key});

  @override
  State<MessageScreenView> createState() => _MessageScreenViewState();
}

class _MessageScreenViewState extends State<MessageScreenView> {
  final String _imageMessage = "https://picsum.photos/200/300";
  final String fakeDM = "Merhaba, nasilsin?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
      ),
      body: _messageListView,
    );
  }

  Widget get _messageListView => ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _messageList;
        },
      );

  Widget get _messageList => Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(_imageMessage),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text("@alp")
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 1),
              Text(fakeDM),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/widgets/post_button.dart';

class TwitterNotification extends StatefulWidget {
  const TwitterNotification({super.key});

  @override
  State<TwitterNotification> createState() => __TwitterNotificationStateState();
}

class __TwitterNotificationStateState extends State<TwitterNotification> {
  String _image = "https://picsum.photos/200/300";
  String messageNotification =
      "Hello, this is a fake message. I hope your application will be nice.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _elevatedButton("Tümü"),
                _elevatedButton("Onaylanmış"),
                _elevatedButton("Bahsedilenler"),
              ],
            ),
          ),
          Expanded(child: _listNotificationView),
        ],
      ),
    );
  }

  Widget _elevatedButton(String filter) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(filter),
    );
  }

  Widget get _listNotificationView => ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _notificationCard;
        },
      );

  Widget get _notificationCard => Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(_image),
                radius: 15,
              ),
              const SizedBox(width: 10),
              const Text("@name"),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(messageNotification),
              const SizedBox(height: 10),
              _postButtonList,
            ],
          ),
        ),
      );

  Widget get _postButtonList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PostButton(icon: Icons.favorite, count: "15", onPressed: () {}),
          PostButton(icon: Icons.comment, count: "20", onPressed: () {}),
          PostButton(icon: Icons.repeat, count: "25", onPressed: () {}),
          PostButton(icon: Icons.share, count: "30", onPressed: () {}),
        ],
      );
}

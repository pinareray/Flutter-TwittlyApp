import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/widgets/post_button.dart';
import 'tabbar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView(this.controller);

  final ScrollController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _randomImage = "https://picsum.photos/200/300";
  String fakeMessage =
      "When you realize how precious and fragile life is, it changes your whole perspective.";
  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: _listView,
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      );

  Widget get _listView => ListView.builder(
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(_randomImage),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text("@niemand", style: titleTextStyle),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(fakeMessage),
              SizedBox(height: 10),
              _placeHolderField,
              _textButtonList,
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _placeHolderField => Container(
        height: 100,
        child: Placeholder(),
      );

  Widget get _textButtonList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PostButton(icon: Icons.favorite, count: "15", onPressed: () {}),
          PostButton(icon: Icons.comment, count: "20", onPressed: () {}),
          PostButton(icon: Icons.repeat, count: "25", onPressed: () {}),
          PostButton(icon: Icons.share, count: "30", onPressed: () {}),
        ],
      );
}

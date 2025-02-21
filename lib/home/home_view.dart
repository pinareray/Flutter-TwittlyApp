import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabbar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView(this.controller);

  final ScrollController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _randomImage = "https://picsum.photos/200/300";
  String fakeMessage = "When you realize how precious and fragile life is, it changes your whole perspective.";
  bool isHeaderClose = false;
  double lastOffset = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body:_listView,
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
          _iconLabelButton,
          _iconLabelButton2,
          _iconLabelButton,
          _iconLabelButton
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
        const Icon(
            Icons.favorite,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget _iconLabel2(String text1) => Wrap(
    spacing: 5,
    children: [const Icon(Icons.comment, color: Colors.grey,),
    Text(text1)],
  );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );

   Widget get _iconLabelButton2 => InkWell(
        child: _iconLabel2("1"), 
        onTap: () {},
      );
}

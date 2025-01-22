
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _photoUrl = "https://randomuser.me/api/portraits/men/1.jpg";
  int defaultTabLength = 4;
  late ScrollController scrollController;
  String _randomImage = "https://picsum.photos/200/300";
  String fakeMessage = "When you realize how precious and fragile life is, it changes your whole perspective.";
  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }
      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: SafeArea(
        child: DefaultTabController(
          length: defaultTabLength,
          child: Column(
            children: [
              _containerAppbar,
              _tabbarItems,
              _expandedListView,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.send),
      );

  Widget get _appBar => AppBar(
        elevation: 0,
        centerTitle: false,
        title: _appBarItems,
      );

  Widget get _containerAppbar => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBarItems => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(_photoUrl)),
          SizedBox(width: 10),
          Text("Home", style: titleTextStyle),
        ],
      );

  Widget get _tabbarItems => const TabBar(tabs: <Widget>[
        Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.search),
        ),
        Tab(
          icon: Icon(Icons.notifications),
        ),
        Tab(
          icon: Icon(Icons.message),
        ),
      ]);

  Widget get _expandedListView => Expanded(child: _listView);

  Widget get _listView => ListView.builder(
        itemCount: 10,
        controller: scrollController,
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
          _iconLabelButton,
          _iconLabelButton,
          _iconLabelButton
        ],
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
          Icon(
            Icons.favorite,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _iconLabelButton => InkWell(
        child: _iconLabel("1"),
        onTap: () {},
      );
}

final titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
);

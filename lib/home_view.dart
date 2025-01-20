
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener((){print(scrollController.offset);});
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
              _appBar, 
              _tabbarItems,
             _expandedListView,
             ],
         ),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
    onPressed: (){}, child: const Icon(Icons.send),);

  Widget get _appBar => AppBar(
    title: _appBarItems,
  );
  Widget get _appBarItems => Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 10,
    children: [
      CircleAvatar(backgroundImage: NetworkImage(_photoUrl)),
      Text("Home", style: titleTextStyle)],
      );

  Widget get _tabbarItems => const TabBar(tabs: <Widget> [
            Tab (icon: Icon(Icons.home),),
            Tab (icon: Icon(Icons.search),),
            Tab (icon: Icon(Icons.notifications),),
            Tab (icon: Icon(Icons.message),),
   ],
  );

  Widget get _expandedListView => Expanded(child: _listView,);

  Widget get _listView => ListView.builder(
    itemCount: 10,
    controller: ScrollController(),
    itemBuilder: (context , index){
    return _listViewCard;
 });

  Widget get _listViewCard => Card(
    child: ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage),),
      title: Wrap(children: [
        Text("@niemand", style: titleTextStyle,),
        Text(fakeMessage),
      ],),
    ),
  );
}

final titleTextStyle = 
TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black,);
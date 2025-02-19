import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/custom/refresh2.dart';
import 'package:flutter_twittly_app/model/trend_topic.dart';

class SearchView extends StatefulWidget {
  const SearchView(this.scrollController, {super.key});
  final ScrollController scrollController;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  double _padding = 10;
  late TrendTopic _topic;
  bool isRefresh = false;

  @override
  void initState() {
    super.initState();
    _topic = TrendTopic(hashtag: "#Champion GS", location: "Trending in Turkey", tweets: "16.9K Tweets");
    
  }

  Future<void> tempFuture() async {
    setState(() {
      isRefresh = !isRefresh;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      isRefresh = !isRefresh;
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator2(
      onRefresh: tempFuture,
      child: ListView(
        children: <Widget>[
          _downIconWidget,
          _emptySpace,
          _trendTitleWidget,
          _listHashView,
        ],
      ),
    );
  }

  Widget get _emptySpace => SizedBox(height: 10);


  Widget get _downIconWidget => AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isRefresh ? 60 : 30,
      child: isRefresh ? Center(child: CircularProgressIndicator()): Icon(Icons.arrow_downward,color: Colors.grey,),
      );

  Widget get _trendTitleWidget => Card(
    color: Theme.of(context).scaffoldBackgroundColor,
    margin: const EdgeInsets.only(bottom: 10),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
      side: const BorderSide(color: Colors.grey),
    ),
    child: Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: _padding),
      alignment: Alignment.centerLeft,
      child: Text(
        "Trends for you",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
      ),
    ),
  );

  Widget get _divider => Divider(height: 0, color: Colors.grey);

  Widget get _listHashView => ListView.separated(
          itemCount: 7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context,index) => _divider, 
          itemBuilder: (context, index) => cardListMethod(context));

  Card cardListMethod(BuildContext context) {
    return Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(side: BorderSide(style: BorderStyle.none)),
          child: listPadding(context),
        );
  }

  Padding listPadding(BuildContext context) {
    return Padding( 
            padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 5),
            child:  row(context),
          );
  }

  Row row(BuildContext context) {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
                child: Wrap(
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  Text( _topic.location ?? 'No Location', style: Theme.of(context).textTheme.bodyMedium,),
                  Text(_topic.hashtag ?? 'No Hashtag', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 22)),
                  Text(_topic.tweets ?? 'No Tweets', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              )),
              Icon(Icons.arrow_drop_down)
            ],);
  }

}


import 'package:flutter/material.dart';
import './home01.dart';
import './home02.dart';
import './home03.dart';
import './home04.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {

  List<MapEntry<int, Color>> colorsList = [
    MapEntry(1, Colors.yellow),
    MapEntry(2, Colors.yellow),
    MapEntry(3, Colors.yellow),
    MapEntry(4, Colors.yellow),
    MapEntry(5, Colors.yellow),
    MapEntry(6, Colors.yellow),
    MapEntry(7, Colors.yellow),
    MapEntry(8, Colors.yellow),
    MapEntry(9, Colors.yellow),
    MapEntry(10, Colors.yellow),
  ];

  final List<Tab> tabs = <Tab>[
    Tab(
      text: '１週間前まで',
    ),
    Tab(
      text: "前日まで",
    ),
    Tab(
      text: "当日",
    ),
    Tab(
      text: "現地",
    )
  ];

  final List<Widget> _tabs = [
    AppBarA(),
    AppBarB(),
    AppBarC(),
    AppBarD(),
  ];

  Widget _myHandler;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _myHandler = _tabs[0];
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      _myHandler = _tabs[_tabController.index];
    });
    debugPrint("tab index : " + _tabController.index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("忘れ物チェックリスト",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0,
                vertical: 8),
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) {
            return _createTab(tab);
          }).toList(),)
    );
  }

  Widget _createTab(Tab tab){
    return Center(
      child: buildGridView(),
    );
  }

  Widget buildGridView(){
    return _tabs[_tabController.index];
  }
}
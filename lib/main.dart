import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: TripList(),
    );
  }
}

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList>
    with SingleTickerProviderStateMixin {
  TabController interviewPageTabController;
  Map<String, dynamic> tripList;
  List data;

  @override
  void initState() {
    interviewPageTabController = TabController(vsync: this, length: 2);
    // tripList = json.decode(tripsJson);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 46, 61),
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Icon(
              Icons.access_time,
              size: 35.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'tripsteps',
              style: TextStyle(
                  fontFamily: '', fontWeight: FontWeight.w800, fontSize: 30.0),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 30.0,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 46, 61),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 157, 204),
            ),
            child: TabBar(
              controller: interviewPageTabController,
              labelColor: Colors.white,
              labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              tabs: <Widget>[
                Tab(
                  child: Text('INTEVIEWS'),
                ),
                Tab(
                  child: Text('STATISTICS'),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 138.0,
            child: TabBarView(
              controller: interviewPageTabController,
              children: <Widget>[
                Container(
                  child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('load_json/trips.json'),
                    builder: (context, snapshot) {
                      // Decode Json
                      var trips = json.decode(snapshot.data.toString());
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return getInterviewTile(
                              trips[index]['place'],
                              trips[index]['year'],
                              trips[index]['month'],
                              trips[index]['days'],
                              trips[index]['kms'],
                              "assets/" + trips[index]['image']);
                        },
                        itemCount: trips == null ? 0 : trips.length,
                      );
                    },
                  ),
                  // child: ListView(
                  //   children: <Widget>[
                  //     getInterviewTile('Madurai', '2018', 'February', '3', '0'),
                  //     getInterviewTile(
                  //         'Switzerland', '2018', 'January', '4', '0'),
                  //   ],
                  // ),
                ),
                Text('Statistics')
              ],
            ),
          )
          // TabBarView(
          //   controller: interviewPageTabController,
          //   children: <Widget>[
          //     Text('One'),
          //     Text('Two') // Padding(
          //     //   padding: EdgeInsets.all(10.0),
          //     //   child: ListView(
          //     //     children: <Widget>[
          //     //       Text('One'),
          //     //       Text('Two')
          //     //       // getInterviewTile('Madurai', '2018', 'February', '3', '0'),
          //     //       // getInterviewTile(
          //     //       //     'Switzerland', '2018', 'January', '4', '0'),
          //     //     ],
          //     //   ),
          //     // ),
          //     // Padding(padding: EdgeInsets.all(10.0), child: Text('Statistics'))
          //   ],
          // )
        ],
      ),
    );
  }

  getInterviewTile(String name, String year, String month, String numDays,
      String numKms, String imageUrl) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.only(left: 20.0, right: 10.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Trip Detail"),
                                  content:
                                      Text("Clicked, Still in development"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(year,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text(month,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(numDays,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text('days',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(numKms,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text('kilometers',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Test';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

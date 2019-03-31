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
      home: InterviewList(),
    );
  }
}

class InterviewList extends StatefulWidget {
  @override
  _InterviewListState createState() => _InterviewListState();
}

class _InterviewListState extends State<InterviewList>
    with SingleTickerProviderStateMixin {
  TabController interviewPageTabController;

  @override
  void initState() {
    interviewPageTabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InteviewSteps'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TabBar(
            controller: interviewPageTabController,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                child: Text('INTEVIEWS'),
              ),
              Tab(
                child: Text('STATISTICS'),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 128.0,
            child: TabBarView(
              controller: interviewPageTabController,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    getInterviewTile('Madurai', '2018', 'February', '3', '0'),
                    getInterviewTile(
                        'Switzerland', '2018', 'January', '4', '0'),
                  ],
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

  getInterviewTile(
      String name, String year, String month, String numDays, String numKms) {
    return Container(
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      height: 200,
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
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w800),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(year,
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.w600)),
                      Text(month,
                          style: TextStyle(
                              fontSize: 8.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(numDays,
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.w600)),
                      Text('Days',
                          style: TextStyle(
                              fontSize: 8.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(numKms,
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.w600)),
                      Text('Kilometers',
                          style: TextStyle(
                              fontSize: 8.0, fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.people),
              ),
            ],
          )
        ],
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

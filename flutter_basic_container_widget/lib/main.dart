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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

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
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new PaddingWidgetTextRoute();
                }));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.lock_open,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new ContainerWidgetTextRoute();
                }));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.atm,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new SimpleScalfoldDemo();
                }));
              },
            )
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

class PaddingWidgetTextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaddingWidget"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Hello world"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text("This is my war"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 90.0, 40.0),
              child: Text("So what"),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90.0, minHeight: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 60, minHeight: 60),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        blurRadius: 4.0)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),
                child: Container(
                  padding: const EdgeInsets.all(14.0),
                  color: Colors.deepOrange,
                  child: Text("Transform Text"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerWidgetTextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 120),
        constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 4.0)
            ]),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        child: Text(
          '5.20',
          style: TextStyle(color: Colors.white, fontSize: 50.0),
        ),
      ),
    );
  }
}

class SimpleScalfoldDemo extends StatefulWidget {
  @override
  _SimpleScalfoldDemoState createState() => _SimpleScalfoldDemoState();
}

class _SimpleScalfoldDemoState extends State<SimpleScalfoldDemo> with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ['新闻','历史','访谈'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              print("share");
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
          );
        }).toList(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('收藏')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.hearing),
              title: Text('听筒')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fingerprint),
              title: Text('安全')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _itemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {

        },
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/icon.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




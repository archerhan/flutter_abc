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
  TextEditingController _usernameTextController = new TextEditingController();
  TextEditingController _pwdTextController = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  GlobalKey _formKey = new GlobalKey<FormState>();


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _usernameTextController.addListener((){
      print('Input usename is '+ _usernameTextController.text);
    });

    _pwdTextController.addListener((){
      print('Input password is '+ _pwdTextController.text);
    });

    focusNode1.addListener((){
      print(focusNode1.hasFocus);
    });

    focusNode2.addListener((){
      print(focusNode2.hasFocus);
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
        child: Form(
          key: _formKey,
            autovalidate: true,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _usernameTextController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person,color: Colors.green,),
                    labelText: 'Account',
                    hintText: 'Your email address',

                  ),
                  focusNode: focusNode1,
                  validator: (v){
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";

                  },
                ),
                TextFormField(
                  controller: _pwdTextController,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock,color: Colors.red,),
                    labelText: 'Password',
                    hintText: 'Your password',

                  ),
                  focusNode: focusNode2,
                  validator: (v){
                    return v
                        .trim()
                        .length > 5 ? null : "密码大于6位";
                  },

                ),

                Padding(
                  padding: EdgeInsets.only(top:28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          child: Text("登录"),
                          color: Theme
                              .of(context)
                              .primaryColor,
                          textColor: Colors.white,
                          onPressed: (){
                            //在这里不能通过此方式获取FormState，context不对
                            //print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if((_formKey.currentState as FormState).validate()){
                              //验证通过提交数据
                              print("验证通过");
                            }
                          },

                        ),
                      )
                    ],
                  ),
                ),
//                Builder(builder: (ctx){
//                  return Column(
//                    children: <Widget>[
//                      RaisedButton(
//                        child: Text('移动焦点'),
//                        onPressed: (){
//                          if (null == focusScopeNode) {
//                            focusScopeNode = FocusScope.of(context);
//                          }
//                          focusScopeNode.requestFocus(focusNode2);
//                        },
//                      ),
//                      RaisedButton(
//                        child: Text('隐藏键盘'),
//                        onPressed: (){
//                          focusNode1.unfocus();
//                          focusNode2.unfocus();
//                        },
//                      ),
//                    ],
//                  );
//                }),
              ],
            )
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

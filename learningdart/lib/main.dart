import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonName = 'Click';
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
      ),
      body: Center(
          child: currentIndex == 0
              ? Container(
                  //width: double.infinity,
                  //height: double.infinity,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.red, primary: Colors.yellow),
                          onPressed: () {
                            // setState(() {
                            //   buttonName = 'Clicked';
                            // });
                          },
                          child: Text(buttonName)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const SecondPage();
                            }));
                          },
                          child: const Text('Next Page')),
                    ],
                  ),
                )
              : Image.asset('images/test.jpeg')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(label: 'Setting', icon: Icon(Icons.settings))
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          // setState(() {
          //   currentIndex = index;
          // });
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(children: [
        DragTarget<Color>(
            builder: (context, _, __) => Container(
                  width: 150,
                  height: 150,
                  color: Colors.yellowAccent,
                )),
        Draggable<Color>(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
          feedback: Container(
            width: 150,
            height: 150,
            color: Colors.green,
          ),
          childWhenDragging: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
          ),
        )
      ]),
    );
  }
}

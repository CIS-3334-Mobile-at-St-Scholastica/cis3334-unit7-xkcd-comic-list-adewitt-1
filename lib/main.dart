import 'package:flutter/material.dart';
import 'comic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'XKCD Comic List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Comic> xkcdComics = [];

  _MyHomePageState() {
    xkcdComics.add( new Comic(844,"https://imgs.xkcd.com/comics/good_code.png","Good Code"));
    xkcdComics.add( new Comic(1513,"https://imgs.xkcd.com/comics/code_quality.png","Code Quality"));
    xkcdComics.add( new Comic(163,"https://imgs.xkcd.com/comics/donald_knuth.png","Donald Knuth"));
    xkcdComics.add( new Comic(2228,"https://imgs.xkcd.com/comics/machine_learning_captcha.png","Machine Learning Captcha"));
    xkcdComics.add( new Comic(1667,"https://imgs.xkcd.com/comics/algorithms.png","Algorithms"));
    // Adding one!
    xkcdComics.add( new Comic(1742, "https://imgs.xkcd.com/comics/will_it_work.png", "Will It Work"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: xkcdComics.length,
        itemBuilder: (BuildContext context, int index) {
          Comic comic = xkcdComics[index];
          return Card(
            color: Colors.lightBlue[50],
            elevation: 5.0,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(comic.title),
              subtitle: Text("Number: ${comic.num.toString()}"),
              leading: Image (image: NetworkImage(comic.img),),
            ),
          );
        },),
    );
  }
}

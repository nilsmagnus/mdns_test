import 'package:flutter/material.dart';
import 'package:multicast_dns/multicast_dns.dart';

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

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _startScan();
        },
        tooltip: 'Scan',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _startScan() async {
    final MDnsClient client = MDnsClient();
    await client.start();
    String name ="_http._tcp.local";
    await for (final IPAddressResourceRecord record in client
        .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(name))) {
      print('Found address (${record.address}).');
    }

    await for (final IPAddressResourceRecord record in client
        .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv6(name))) {
      print('Found address (${record.address}).');
    }
    client.stop();
  }
}

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String id = 'home_view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Hi, User',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 8.0,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: const [
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: 64.0,
                          ),
                          Text(
                            'Scanner',
                            style: TextStyle(fontSize: 32.0),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'TBD',
                            style: TextStyle(fontSize: 32.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

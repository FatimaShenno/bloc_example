import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homa.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Home(
                 isFitched: true,
              ),
            ),
          ),
          child: const Text('page2'),
        ),
      ),
    );
  }
}

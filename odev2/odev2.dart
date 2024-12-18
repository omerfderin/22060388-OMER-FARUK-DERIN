import 'package:flutter/material.dart';

void main() {
  runApp(const Buton());
}

class Buton extends StatefulWidget {
  const Buton({super.key});

  State <Buton> createState() => Renk();
}

class Renk extends State<Buton> {
  int index = -1;
  List<Color> renkler = [Colors.yellow, const Color.fromARGB(255, 24, 42, 141)];

  Widget build(BuildContext context) {
    Color renk = index == -1 ? Colors.white : renkler[index];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: renk,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    index = (index + 1) % 2;
                  });
                },
                child: Text("RENK DEGİS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

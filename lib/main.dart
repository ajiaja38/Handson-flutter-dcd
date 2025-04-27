import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstScreen(),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;

  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => (),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({super.key, required this.text});

  @override
  State<BiggerText> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;
  String? language;
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.text, style: TextStyle(fontSize: _textSize)),
        ElevatedButton(
          onPressed: () {
            setState(() => _textSize = 32.0);
          },
          child: const Text("Perbesar"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.5, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Text(
            "Halo Aji",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: 'Your language is ',
              children: [
                TextSpan(
                  text: language ?? 'Java',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[100],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(value: 'Dart', child: Text('Dart')),
                DropdownMenuItem<String>(
                  value: 'Kotlin',
                  child: Text('Kotlin'),
                ),
                DropdownMenuItem<String>(
                  value: 'React Native',
                  child: Text('TS'),
                ),
              ],
              hint: Text(
                'Select Language',
                style: TextStyle(color: Colors.white),
              ),
              onChanged: (String? value) {
                setState(() {
                  language = value;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12, left: 10, right: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Write your name...",
              labelText: 'Yourname',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
            onChanged: (String value) {
              setState(() {
                _name = value;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Halo! $_name"),
                  title: Text("Dialog"),
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Submit"),
        ),
        const SizedBox(height: 10),
        Center(
          child: Image.network(
            'https://picsum.photos/200/300',
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}

//screen
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "First Screen",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => (),
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[BiggerText(text: "Hello World")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
    );
  }
}

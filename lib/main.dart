import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo Uygulaması",
      home: iskele(),
    );
  }
}

class iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("alişveriş Listesi Uygulaması"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];
  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, indexNumarasi) => ListTile(
                title: Text(alisverisListesi[indexNumarasi]),
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: elemanEkle,
            child: const Text("Ekle"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: elemanCikar, child: const Text("Çıkar")),
        ],
      ),
    );
  }
}

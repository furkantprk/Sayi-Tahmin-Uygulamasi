import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/oyunEkrani.dart';
import 'package:sayi_tahmin_oyunu/sonucEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    final double ekranYuksekligi = ekranBilgisi.size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ekranYuksekligi / 10, bottom: ekranYuksekligi / 7),
              child: Text(
                "TAHMİN OYUNU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ekranYuksekligi / 25,
                ),
              ),
            ),
            SizedBox(
                height: ekranYuksekligi / 5,
                child: Image.asset("resimler/zar.png")),
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 15),
              child: SizedBox(
                width: ekranGenisligi / 2,
                height: ekranYuksekligi / 12,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => oyunEkrani()));
                  },
                  child: Text(
                    "Oyuna Başla",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ekranYuksekligi / 35),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

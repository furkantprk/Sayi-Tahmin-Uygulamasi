import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/sonucEkrani.dart';

class oyunEkrani extends StatefulWidget {
  @override
  State<oyunEkrani> createState() => _oyunEkraniState();
}

class _oyunEkraniState extends State<oyunEkrani> {
  int kalan = 5;
  var tfTahmin = TextEditingController();
  late int randomNumber;
  String yardim = "";

  @override
  void initState() {
    super.initState();
    var random = Random();
    randomNumber = random.nextInt(100);
    print("oluşturulan random sayı:${randomNumber}");
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    final double ekranYuksekligi = ekranBilgisi.size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Tahmin Ekranı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 7),
              child: Text(
                "Kalan tahmin hakkı:${kalan}",
                style: TextStyle(
                  fontSize: ekranYuksekligi / 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ekranYuksekligi / 15, bottom: ekranYuksekligi / 15),
              child: Text("Yardım : ${yardim}",
                  style: TextStyle(
                      fontSize: ekranYuksekligi / 40,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: ekranGenisligi / 15, right: ekranGenisligi / 15),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: InputDecoration(
                    hintText: "Tahmininizi yazınız",
                    label: Text(
                      "Tahmin",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: ekranYuksekligi / 35,
                          fontWeight: FontWeight.bold),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 15),
              child: SizedBox(
                width: ekranGenisligi / 2,
                height: ekranYuksekligi / 12,
                child: ElevatedButton(
                  onPressed: () {
                    int kullaniciSayi = int.parse(tfTahmin.text);
                    if (kalan == 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sonucEkrani(false)));
                    }
                    if (kullaniciSayi == randomNumber) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sonucEkrani(true)));
                    } else if (kullaniciSayi > randomNumber) {
                      setState(() {
                        yardim = "Sayıyı Azaltın";
                      });
                    } else {
                      setState(() {
                        yardim = "Sayıyı Artırın";
                      });
                    }
                    setState(() {
                      kalan = kalan - 1;
                    });
                  },
                  child: Text(
                    "Tahmin Et",
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

import 'package:flutter/material.dart';

class sonucEkrani extends StatefulWidget {
  bool sonuc;
  sonucEkrani(this.sonuc);

  @override
  State<sonucEkrani> createState() => _sonucEkraniState();
}

class _sonucEkraniState extends State<sonucEkrani> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    final double ekranYuksekligi = ekranBilgisi.size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("Sonuç Ekranı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              width: ekranGenisligi / 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: ekranYuksekligi / 7, bottom: ekranYuksekligi / 15),
                child: widget.sonuc
                    ? Image.asset("resimler/smile.png")
                    : Image.asset("resimler/sad.png"),
              ),
            ),
            widget.sonuc
                ? Text(
                    "Tebrikler, Kazandınız...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ekranYuksekligi / 25,
                        color: Colors.deepPurple),
                  )
                : Text(
                    "Üzgünüm, Kaybettiniz...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ekranYuksekligi / 25,
                        color: Colors.deepPurple),
                  ),
            Padding(
              padding: EdgeInsets.only(top: ekranYuksekligi / 10),
              child: SizedBox(
                width: ekranGenisligi / 2,
                height: ekranYuksekligi / 12,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: widget.sonuc
                        ? Text(
                            "Yeniden Başlat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ekranYuksekligi / 35),
                          )
                        : Text(
                            "Tekrar Dene",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ekranYuksekligi / 35),
                          )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

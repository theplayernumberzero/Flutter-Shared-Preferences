import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int sayac = 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

  Future<void> sayacKontrol() async{
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac++;
    });
    sp.setInt("sayac", sayac);
  }

  Future<void> test() async{

    var sp = await SharedPreferences.getInstance();

    //Veri Kaydı
    sp.setString("ad", "Bahadir");
    sp.setString("soyad", "Kilic");
    //Veri Silme
    sp.remove("soyad");
    //Veri Okuma
    String gelenAd = sp.getString("ad") ?? "isim yok";
    String gelenSoyad = sp.getString("soyad") ?? "soyad yok";
    print("Gelen ad: $gelenAd");
    print("Gelen soyad: $gelenSoyad");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Uygulamanın açılış sayısı: $sayac", style: TextStyle(fontSize: 50,),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

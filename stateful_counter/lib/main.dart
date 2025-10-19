import 'package:flutter/material.dart';
//Adım1.1 Uygulamanon giriş kısmı
void main() {
  runApp(const MyApp());


}

//Adım1.2 uygulamanın kök widget'ı (konfigürasyon katmanı)
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override

  Widget build (BuildContext context){
    //MaterialApp, uygulamamızın temel iskeletini ve tasarım dilini sağlar.

    return MaterialApp(
      title: 'Gelistirilmis Sayac', //uyg. sistemdeki adı
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage (title:'Furkan\'ın Sayacı'),

    );
  }
}

//Adım 2.1 : Durumlu state Widget'ın kendisi
class MyHomePage extends StatefulWidget{

  //furkan:Bu widget, dışarıdan (MyApp'ten) bir başlık bilgisi alır
  const MyHomePage({super.key, required this.title });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

//Adım2.2 Durum (state) sınıfı
//Değişkenler ve mantık bu sınıfta başlar

class _MyHomePageState extends State<MyHomePage> {
//Adım 4.1 Durumu tutan değişken
  int _counter = 0;

//furkan: neden her seferinde setState() kullandık
//furkan: Bu, Flutter'a "veri değişti, ekranı yeniden çiz" sinyalini gönderir.!!

//Adım 4.2 Durumu değiştiren metotlar
  void _incrementCounter(){
    setState( () {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState ( (){
      _counter--;
    });

  }
  void _resetCounter(){
    setState (  () {
      _counter = 0;
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //furkan:Adım 3.1 : üstteki uygulama çubuğu
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        //furkan:Adım3.2 Sayfanın gövdesi
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text(
                'Sayac Degeri : ',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '$_counter', //Adım 4.3: Sabit "0" yerien değişkeni bağlıyoruz
                style: Theme.of(context).textTheme.headlineMedium,

              ),
              //dikkat:butonlar gelecek birazdan
              const SizedBox(height: 20),

              //Adım5.1: butonları yatayda dizmek için row widget'ı

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Adım 5.2: azatma butonu
                  FloatingActionButton(onPressed: _decrementCounter,
                    tooltip: 'Azalt',
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width:10), //Butonlar arasına boşluk

                  //Adım 5.3: sıfırlama butonu
                  FloatingActionButton(onPressed: _resetCounter,
                    tooltip: 'Sıfırla',
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(width:10), //Butonlar arasına boşluk

                  //Adım 5.4 : Arttırma butonu
                  FloatingActionButton(onPressed: _incrementCounter,
                    tooltip: 'Arttır',
                    child: const Icon (Icons.add),
                  ),
                ],
              )


            ],
          ),
        )



    );
  }

}





// ignore_for_file: dead_code
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:day_over/product/constants/image_path_constants.dart';
import 'package:day_over/product/constants/string_constants.dart';
import 'package:day_over/product/constants/text_fonts_constants.dart';
import 'package:day_over/product/widgets/anasayfa_container_slider.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    final controller = PageController(
      initialPage: 0,
    );
    var list2 = [
      "Düzenli fiziksel aktivitenin kan dolaşımını artırdığı, karaciğer fonksiyonu ve enzimlerini düzenlediği, kilo kaybından bağımsız olarak inflamasyonu ve obeziteye bağlı lenfatik disfonksiyonu tedavi ettiği kanıtlanmıştır.",
      "Obezite, vücutta sağlığı bozacak ölçüde aşırı yağ birikmesi olarak tanımlanıyor. Diyabetten, kalp hastalıklarına, infertiliteden kansere pek çok olumsuz sağlık sorununa davetiye çıkaran obezite, tedavi edilebilir bir hastalıktır.",
      "Obezite birçok hastalık ve erken ölüm için güçlü risk faktörüdür. Obezite sorunu ile karşı karşıya olan 25 yaşındaki bir erkeğin yaşam beklentisi %22 oranında azalmakta ve yaşam süresinden 12 yıl eksilmektedir.",
    ];
    double containerWidth = 0;
    double containerHeight = 0;
    var list = [
      "30 dk futbol oyna",
      "25 dk koş",
      "1 saat yürü",
      "30 dk voleybol oyna",
      "ali topa bak",
      "30 dk voleybol oyna",
      "ali topa bak",
    ];
    double yukseklik = (MediaQuery.of(context).size.height / 2.60);
    final _gradientColors = [Color(0xFF5DE0E6), Color(0xFF004AAD)];
    if (MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height) {
      textSize = MediaQuery.of(context).size.height / 17;
      containerWidth = MediaQuery.of(context).size.width / 2;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    } else {
      textSize = MediaQuery.of(context).size.width / 17;
      containerWidth = MediaQuery.of(context).size.width;
      containerHeight = MediaQuery.of(context).size.height / 1.55;
    }
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Column(
          children: <Widget>[
            CustomAppBar(appBarText: "Ana Sayfa", textSize: textSize),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/homelimages/icons8-info-50.png",
                              ),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 8),
                            Container(
                              color: Colors.white,
                              child: Text("Değerli Bilgiler"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: yukseklik,
                            padding: EdgeInsets.all(10),
                            child: PageView(
                              controller: controller,
                              scrollDirection: Axis.horizontal,
                              children: [
                                homeInform(data: list2[0]),
                                homeInform(data: list2[1]),
                                homeInform(data: list2[2]),
                              ],
                            ),
                          ),
                          SmoothPageIndicator(
                            controller: controller,
                            count: list2.length,
                            effect: SlideEffect(
                              spacing: 8.0,
                              radius: 4.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              paintStyle: PaintingStyle.stroke,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/homelimages/icons8-info-50.png",
                              ),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 8),
                            Container(
                              color: Colors.white,
                              child: Text("Rastgele Görevler"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: yukseklik,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: kToolbarHeight,
                              width: MediaQuery.of(context).size.width / 2,
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 16.0,
                                left: 16.0,
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height,
                                  ),
                                  color: Colors.blue),
                              child: Text(
                                list[index],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(246, 246, 246, 246),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(246, 246, 246, 246),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(223, 223, 223, 223),
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

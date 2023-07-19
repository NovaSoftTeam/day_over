import 'package:day_over/features/sign_up/sign_viev_model.dart';
import 'package:day_over/features/task/all_task_view_model.dart';
import 'package:day_over/product/models/task_model.dart';
import 'package:day_over/product/widgets/anasayfa_container_slider.dart';
import 'package:day_over/product/widgets/custom_app_bar.dart';
import 'package:day_over/product/widgets/custom_circular_indicator.dart';
import 'package:day_over/product/widgets/custom_drawer.dart';
import 'package:day_over/product/widgets/main_task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController(
      initialPage: 0,
    );
    var list2 = [
      "Düzenli fiziksel aktivitenin kan dolaşımını artırdığı, karaciğer fonksiyonu ve enzimlerini düzenlediği, kilo kaybından bağımsız olarak inflamasyonu ve obeziteye bağlı lenfatik disfonksiyonu tedavi ettiği kanıtlanmıştır.",
      "Obezite, vücutta sağlığı bozacak ölçüde aşırı yağ birikmesi olarak tanımlanıyor. Diyabetten, kalp hastalıklarına, infertiliteden kansere pek çok olumsuz sağlık sorununa davetiye çıkaran obezite, tedavi edilebilir bir hastalıktır.",
      "Obezite birçok hastalık ve erken ölüm için güçlü risk faktörüdür. Obezite sorunu ile karşı karşıya olan 25 yaşındaki bir erkeğin yaşam beklentisi %22 oranında azalmakta ve yaşam süresinden 12 yıl eksilmektedir.",
    ];

    double yukseklik = (MediaQuery.of(context).size.height / 2.60);

    Future<List<TaskModel>> getTasks() async {
      List<TaskModel> tasks = await ref
          .watch(allTaskProvider.notifier)
          .filteredList(ref.watch(userUidProvider));
      if (tasks.length <= 5) {
        return tasks;
      } else {
        List<TaskModel> newTasks = [];
        for (int i = 0; i < 4; i++) {
          newTasks.add(tasks[i]);
        }
        return newTasks;
      }
    }

    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body: Column(
          children: <Widget>[
            const CustomAppBar(appBarText: "Ana Sayfa"),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                "assets/homelimages/icons8-info-50.png",
                              ),
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 8),
                            Container(
                              color: Colors.white,
                              child: const Text("Değerli Bilgiler"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: yukseklik,
                            padding: const EdgeInsets.all(10),
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
                            effect: const SlideEffect(
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
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                "assets/homelimages/icons8-info-50.png",
                              ),
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 8),
                            Container(
                              color: Colors.white,
                              child: const Text("Rastgele Görevler"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: yukseklik,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(246, 246, 246, 246),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(246, 246, 246, 246),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(223, 223, 223, 223),
                              blurRadius: 4,
                              offset: Offset(4, 8),
                            ),
                          ],
                        ),
                        child: FutureBuilder(
                          future: getTasks(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MainTaskItem(
                                        task: snapshot.data![index],
                                      ));
                                },
                              );
                            } else {
                              return const CustomCircularIndicator();
                            }
                          },
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

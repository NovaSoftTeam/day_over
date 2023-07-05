import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double textSize = 0;
    double containerWidth = 0;
    double containerHeight = 0;
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/informScreenImages/image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Container(),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Ana Sayfa'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
              ),
              const ListTile(
                leading: Icon(Icons.graphic_eq),
                title: Text('Veriler'),
              ),
              const ListTile(
                leading: Icon(Icons.store),
                title: Text('Mağaza'),
              ),
              const ListTile(
                leading: Icon(Icons.art_track),
                title: Text('Art Book'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('Görevler'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GlacialIndifference-Regular',
                color: Colors.black,
                fontSize: textSize,
              ),
              'Profil'),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  elevation: MaterialStateProperty.all(0.0),
                ),
                onPressed: () {},
                icon: Image.asset('assets/informScreenImages/coin.png'),
                label: const Text(
                  '450',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height / 2.7,
                      child: Column(
                        children: [
                          SizedBox(
                            height: containerHeight / 20,
                          ),
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                                'assets/informScreenImages/rick.png'),
                          ),
                          Text(
                            style: TextStyle(
                              fontFamily: 'glacial-indifference-bold',
                              fontSize: textSize,
                            ),
                            'Rick Sanchez',
                          ),
                          Text(
                            style: TextStyle(
                              fontFamily: 'GlacialIndifference-Regular',
                              fontSize: textSize / 1.5,
                            ),
                            'PickleRickkkk@gmail.com',
                          ),
                          SizedBox(
                            height: containerHeight / 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: textSize / 1.5,
                                    ),
                                    'age: 70',
                                  ),
                                  SizedBox(
                                    height: containerHeight / 40,
                                  ),
                                  Text(
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: textSize / 1.5,
                                    ),
                                    'boy: 196',
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: textSize / 1.5,
                                    ),
                                    'kilo: 86',
                                  ),
                                  SizedBox(
                                    height: containerHeight / 40,
                                  ),
                                  Text(
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: textSize / 1.5,
                                    ),
                                    'cinsiyet: erkek',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: containerHeight / 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                          style: TextStyle(
                            fontFamily: 'glacial-indifference-bold',
                            fontSize: textSize / 1.5,
                          ),
                          'Profili Düzenle'),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/informScreenImages/profiliDuzenle.png'),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: textSize / 1.15,
                        ),
                        'Genel Ayarlar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                          style: TextStyle(
                            fontFamily: 'glacial-indifference-bold',
                            fontSize: textSize / 1.5,
                          ),
                          'Hakkında'),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/informScreenImages/hakkinda.png'),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                          style: TextStyle(
                            fontFamily: 'glacial-indifference-bold',
                            fontSize: textSize / 1.5,
                          ),
                          'Uygulamayı Oyla'),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/informScreenImages/uygulamayiOyla.png'),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                        onTap: () {},
                        title: Text(
                            style: TextStyle(
                              fontFamily: 'glacial-indifference-bold',
                              fontSize: textSize / 1.5,
                            ),
                            'Uygulamayı Paylas'),
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/informScreenImages/paylas.png'),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:day_over/features/profileScreen/edit.dart';
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
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Ana Sayfa'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                leading: Icon(Icons.person),
                title: Text('Profil'),
              ),
              ListTile(
                leading: Icon(Icons.graphic_eq),
                title: Text('Veriler'),
              ),
              ListTile(
                leading: Icon(Icons.store),
                title: Text('Mağaza'),
              ),
              ListTile(
                leading: Icon(Icons.art_track),
                title: Text('Art Book'),
              ),
              ListTile(
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
        body: SingleChildScrollView(
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
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/informScreenImages/rick.png'),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileEdit(),
                        ),
                      );
                    },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Positioned(
                                          left: -20,
                                          top: -20,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              foregroundColor: Colors.black,
                                              child: Icon(Icons.close_sharp),
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          'assets/informScreenImages/DAYOVER.png'),
                                    ),
                                    Text(
                                      style: TextStyle(
                                        fontFamily: 'glacial-indifference-bold',
                                        fontSize: textSize,
                                      ),
                                      'Hakkımızda',
                                    ),
                                    SizedBox(
                                      height: containerHeight / 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0, horizontal: 4.0),
                                      child: Card(
                                        child: ListTile(
                                          onTap: () {},
                                          title: Text(
                                            style: TextStyle(
                                              fontFamily:
                                                  'glacial-indifference-bold',
                                              fontSize: textSize / 2,
                                            ),
                                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: containerHeight / 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0, horizontal: 4.0),
                                      child: Card(
                                        child: ListTile(
                                          onTap: () {},
                                          title: Text(
                                            style: TextStyle(
                                              fontFamily:
                                                  'glacial-indifference-bold',
                                              fontSize: textSize / 2,
                                            ),
                                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: containerHeight / 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    title: Text(
                        style: TextStyle(
                          fontFamily: 'glacial-indifference-bold',
                          fontSize: textSize / 1.5,
                        ),
                        'Hakkında'),
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/informScreenImages/hakkinda.png'),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
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
                        backgroundImage:
                            AssetImage('assets/informScreenImages/paylas.png'),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uts/main/login.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Image(
                            image: NetworkImage(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113113994664878101/Group_17.png",
                                scale: 1.5)),
                        Text(
                          "M Shahwal Ramadhan Boger",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Colors.white),
                        )
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Pilih Layanan",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Card Button Pilih Layanan
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.greenAccent[100],
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login())),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.network(
                              "https://cdn.discordapp.com/attachments/972198684550897696/1113823102523146380/ecology-book.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(children: [
                          Text(
                            "Edukasi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ])
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113826709830123542/waste.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(children: [
                            Text(
                              "Pengelolaan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113826744479256656/market.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(children: [
                            Text(
                              "Berlangganan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113826756063932496/sales.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(children: [
                            Text(
                              "Daftar Harga",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113826770131624027/time.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(children: [
                            Text(
                              "Riwayat",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.network(
                                "https://cdn.discordapp.com/attachments/972198684550897696/1113826804944347178/resume.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(children: [
                            Text(
                              "Profil",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ]),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifikasi",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Pesan",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
              backgroundColor: Color.fromARGB(121, 255, 7, 7))
        ],
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class contactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 400,
                color: Colors.blue,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AO5QoFLh_DRpDwdWFDkhdMnvNI6xsw3dbw&usqp=CAU'),
                ),
              ),
              Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Jue Thet Ngone\n',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Yangon, Myanmar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: -45,
                child: Card(
                  elevation: 8.0,
                  child: cardRow(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              elevation: 8,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://pickaface.net/gallery/avatar/66961165_171026_2019_co0p.png')),
                    title: Text('Tin Htue Aung'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqI0Zw2BCxBs9hVELkjOsLUlhVO2kXoMLLcE6fVchze_OPhHj52ZkHjWZA4IFhrcRZWds&usqp=CAU')),
                    title: Text('Aung Thet'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cardRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        cardItem('Photo', '5000'),
        Container(
          height: 40,
          width: 1,
          color: Colors.black,
        ),
        cardItem('Follower', '5000'),
        Container(
          height: 40,
          width: 1,
          color: Colors.black,
        ),
        cardItem('Following', '5000'),
      ],
    );
  }

  Widget cardItem(String title, String Message) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(title),
        const SizedBox(
          height: 10,
        ),
        Text(
          Message,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


//about page with info and bottom nav 
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center(
        //text of page 
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('About this app',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'This is a weather app build with flutter and OpenWeatherMap API. For a coure at Linnaeus University.', textAlign: TextAlign.center,),
                SizedBox(
                  height: 20,
                ),
                Text('Made by:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Jessica Ejelöv'),
              ],
            )),
      ),
      //bottomnav with routes
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        //set current index to get different color on navbar for current page
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/'); //go to weather page
              break;
            case 1:
              context.go('/about'); //go to about page
              break;
          }
        },
      ),
    );
  }
}

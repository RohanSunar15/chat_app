import 'package:deepvid/constant/color.dart';
import 'package:deepvid/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Row(
          children: [
            Image.asset('assets/images/deepvid_logo.png', scale: 10),
            CustomText(
              text: 'DeepVid Ai',
              gradient: LinearGradient(
                colors: [
                  linearGradient1,
                  linearGradient2,
                  linearGradient3,
                  linearGradient4,
                  linearGradient5,
                  linearGradient6,
                  linearGradient7,
                  linearGradient8,
                  linearGradient9,
                  linearGradient10,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              fontSize: 35,
              fontFamily: "Nasalization",
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_2_outlined),
            color: white,
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: white),
              child: Text('Home', style: TextStyle(color: white)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle home navigation
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 100,),
          _homeScreenDesign()]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: purple,
          backgroundColor: darkPurple,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: grey,),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv_outlined, color: grey),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note_outlined, color: grey),
                label: ''),

          ])
      ,
    );
  }

  Widget _homeScreenDesign() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 45,
            decoration: BoxDecoration(
                color: purple,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: CustomText(
                text: 'Create. Perform. Entertain.',
                fontWeight: FontWeight.bold,
                fontSize: 25,

              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border()
            ),
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: CustomText(
                  text: 'Transform your creative vision into \n reality with AI-powered music and \n comedy production',
                  fontWeight: FontWeight.bold,
                  fontSize: 23,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

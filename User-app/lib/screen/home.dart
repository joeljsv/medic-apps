import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medic_app/screen/reminder/dates_list.dart';
import 'package:medic_app/screen/reminder/reminder.dart';
import 'package:medic_app/theme/theme.dart';
import 'package:medic_app/widgets/drwaer.dart';
import 'package:medic_app/widgets/home_screen/cahe_images/image_cache.dart';
import 'package:medic_app/widgets/home_screen/options.dart/qwikConsult.dart';
import 'package:medic_app/widgets/home_screen/options.dart/specilist_qwik.dart';
import '../widgets/home_screen/options.dart/firstRowop.dart';
import '../widgets/home_screen/appbar/appbar.dart';
import '../widgets/home_screen/appbar/notification.dart';
import '../widgets/home_screen/coursle_slider/coursel.dart';
import 'doctor/chat_bot/chat_bot.dart';
import 'profile/fit.dart';
import 'profile/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
int currentIndex;
class _HomeScreenState extends State<HomeScreen> {
  @override
  
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    genDat();
    final width = MediaQuery.of(context).size.width;
    final List<Widget> wid = [
      HomeScrenWid(width: width),
    HomePage(),
      Profile(),
    ];
    return Scaffold(
          drawer: widDraw(context),
      appBar: AppBar(
        // Coutumised App drawer******************
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // *******************************************
        title: Apploc(),
        actions: [noti(context)],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: wid[currentIndex]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.appColor.primary,
        child: Icon(
          Icons.messenger_outline,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ChatBot(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: AppTheme.appColor.secondary,
        opacity: .2,

        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          buildBubbleBottomBarItem(Icons.home_filled, "Home"),
          buildBubbleBottomBarItem(Icons.fitness_center, "Fitness"),
          buildBubbleBottomBarItem(LineAwesomeIcons.user, "Profile"),

          // BubbleBottomBarItem(
          //     backgroundColor: Colors.green,
          //     icon: Icon(
          //       Icons.menu,
          //       color: Colors.black,
          //     ),
          //     activeIcon: Icon(
          //       Icons.menu,
          //       color: Colors.green,
          //     ),
          //     title: Text("Menu"))
        ],
      ),
    );
  }

  BubbleBottomBarItem buildBubbleBottomBarItem(IconData icn, String title) {
    return BubbleBottomBarItem(
        backgroundColor: Colors.indigo,
        icon: Icon(
          icn,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icn,
          color: Colors.indigo,
        ),
        title: Text("$title"));
  }
}

class HomeScrenWid extends StatelessWidget {
  const HomeScrenWid({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SingleChildScrollView(
        child: Column(
          children: [
            FirstOpt(),
            // Coursel Slider
            /// Creates a rounded corner container./
            /// List bannerImages[];
// double height=185;
// double width double.infity;
// bool auto =true;
// isDotVisible = true;
            /// pass images

            BannerWidget(
              height: 150,
              width: width - 90,
              bannerImages: [
                "https://safehouseweb.com/wp-content/uploads/2017/08/healthcare-social-media-advertisement.png",
                "https://www.advertgallery.com/wp-content/uploads/2017/11/nova-ivi-fertility-centre-the-longer-you-wait-the-lower-you-chances-ad-times-of-india-kolkata-28-11-2017.png",
                "https://www.luciddiagnostics.in/wp-content/uploads/2020/06/Ad-Slider-1A.png",
              ],
            ),
            QuickConsult(),

            Specialist(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          width: double.infinity,
                        child: ImageCahed(
                          image: "https://www.luciddiagnostics.in/wp-content/uploads/2020/06/Ad-Slider-1A.png",
                          
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

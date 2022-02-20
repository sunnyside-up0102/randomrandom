import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:youtube_ad2/provider/food_name.dart';
import 'result_screen.dart';
import 'package:youtube_ad2/provider/food_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Provider.of<Category>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    //TODO implement didChangeDependencies
    super.didChangeDependencies();
    InterstitialAd.load(
      adUnitId: InterstitialAd.testAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            interstitialAd = ad;
          });
          print("Ad Loaded");
        },
        onAdFailedToLoad: (error) {
          print("Interstitial Failed to load");
        },
      ),
    );
  }

  Map mapItem = {
    '전체': total,
    "중국": chn,
    "한국": kor,
    "일본": jpn,
    "동남아": asia,
    "유럽": eu,
    "브런치": brunch,
  };

  String? value;
  List<String> listItem = [
    "전체",
    "중국",
    "한국",
    "일본",
    "동남아",
    "유럽",
    "아메리카",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage('assets/images/bg3.png'), // 배경 이미지
      //   ),
      // ),
      child: Scaffold(
          backgroundColor: Colors.orange[300],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Center(
              child: Text(
                '오늘의 식사',
                style: TextStyle(
                  fontFamily: 'Chilgok',
                  color: Colors.yellow.shade300,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                        Text('Open!'),
                      ]),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 5,
                      color: Colors.red,
                    ),
                    elevation: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    primary: Colors.orange[300],
                    padding: const EdgeInsets.only(
                      top: 9,
                      bottom: 15,
                      left: 20,
                      right: 20,
                    ),
                  ),
                  onPressed: () {
                    if (isLoaded) {
                      interstitialAd!.show();
                      context
                          .read<FoodResult>()
                          .selectFood(context.read<Category>().category);

                      Get.to(() => ResultScreen());
                    } else {
                      context
                          .read<FoodResult>()
                          .selectFood(context.read<Category>().category);
                      Get.to(() => ResultScreen());
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 3,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.red,
                      width: 4,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 3,
                  height: 40,
                  child: DropdownButton<String>(
                    underline: DropdownButtonHideUnderline(child: Container()),
                    dropdownColor: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0,
                    hint: Text(
                      "음식종류",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    value: value,
                    iconSize: 20,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.red),
                    isExpanded: true,
                    items: listItem.map(valueItem).toList(),
                    onChanged: (value) {
                      setState(() => this.value = value);

                      context
                          .read<Category>()
                          .selectCategory(mapItem[this.value]);
                      debugPrint(context.read<Category>().category.toString());
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }

  DropdownMenuItem<String> valueItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      );
}

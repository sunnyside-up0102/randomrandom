import 'package:provider/provider.dart';
import 'package:youtube_ad2/provider/food_name.dart';
import 'package:youtube_ad2/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:youtube_ad2/screen/home_page.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int adCounter = 0;

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

  @override
  Widget build(BuildContext context) {
    final List category = context.watch<Category>().category;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            '뭐 먹을까?',
            style: TextStyle(
              fontFamily: 'Chilgok',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage('assets/images/bg3.png'), // 배경 이미지
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      left: 10,
                      right: 10,
                      bottom: 30,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        (imageSelector(
                                    context.watch<FoodResult>().foodResult) !=
                                'assets/images/null.jpg')
                            ? imageSelector(
                                context.watch<FoodResult>().foodResult)
                            : 'assets/images/null.jpg',
                        width: MediaQuery.of(context).size.width / 1.4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 40,
                      top: 10,
                      right: 20,
                      left: 20,
                    ),
                    child: Text(
                      context.watch<FoodResult>().foodResult.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 버튼을 누르면 랜덤으로 음식을 골라주고 로딩 애니메이션 화면으로 이동
                    // 음식 골라주는 기능 구현했음
                    // 화면 이동은 구현 안함
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: () {
                          if (isLoaded && adCounter == 3) {
                            interstitialAd!.show();
                            context
                                .read<FoodResult>()
                                .selectFood(context.read<Category>().category);
                            adCounter = 0;
                          } else {
                            context
                                .read<FoodResult>()
                                .selectFood(context.read<Category>().category);
                            adCounter = adCounter + 1;
                          }
                        },
                        child: const Text('다시 고르기')),
                    SizedBox(
                      height: 30,
                    ),
                    // 버튼을 누르면 네이버 지도 앱으로 이동 (앱 미설치 되어 있을 시 플레이 스토어로 이동)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              appStoreLink: null,
                              openStore: true,
                              androidPackageName: 'com.sampleapp',
                            );
                          },
                          icon: Image.asset('assets/images/ce.png'),
                          iconSize: 20,
                        ),
                        IconButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              appStoreLink: null,
                              openStore: true,
                              androidPackageName: 'com.sampleapp',
                            );
                          },
                          icon: Image.asset('assets/images/bm.png'),
                          iconSize: 20,
                        ),
                        IconButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              appStoreLink: null,
                              openStore: true,
                              androidPackageName: 'com.sampleapp',
                            );
                          },
                          icon: Image.asset('assets/images/ygy.png'),
                          iconSize: 20,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              appStoreLink: null,
                              openStore: true,
                              androidPackageName: 'com.sampleapp',
                            );
                          },
                          icon: Image.asset('assets/images/km.png'),
                          iconSize: 20,
                        ),
                        IconButton(
                          onPressed: () async {
                            await LaunchApp.openApp(
                              appStoreLink: null,
                              openStore: true,
                              androidPackageName: 'com.sampleapp',
                            );
                          },
                          icon: Image.asset('assets/images/nm.png'),
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String imageSelector(String foodName) {
  String imageURL = 'assets/images/' + mapImage[foodName].toString() + '.jpg';
  return imageURL;
}

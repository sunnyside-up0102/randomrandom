import 'package:provider/provider.dart';
import 'package:youtube_ad2/provider/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:youtube_ad2/screen/home_page.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final List category = context.watch<Category>().category;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg2.png'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Center(
            child: Text(
              '오늘의 식사',
              style: TextStyle(
                fontFamily: 'Chilgok',
                color: Colors.yellow.shade300,
              ),
            ),
          ),
        ),
        body: Column(
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
                        'assets/images/1.jpg',
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
                      '국밥',
                      style: TextStyle(fontSize: 20, color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 버튼을 누르면 랜덤으로 음식을 골라주고 로딩 애니메이션 화면으로 이동
                    // 음식 골라주는 기능 구현했음
                    // 화면 이동은 구현 안함
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          Get.to(HomePage());
                        },
                        child: const Text('다시 고르기')),
                    // 버튼을 누르면 네이버 지도 앱으로 이동 (앱 미설치 되어 있을 시 플레이 스토어로 이동)
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () async {
                          await LaunchApp.openApp(
                            appStoreLink: null,
                            openStore: true,
                            androidPackageName: 'com.sampleapp',
                          );
                        },
                        child: const Text('배민으로 주문')),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () async {
                          await LaunchApp.openApp(
                            appStoreLink: null,
                            openStore: true,
                            androidPackageName: 'com.nhn.android.nmap',
                          );
                        },
                        child: const Text('네이버 지도에서 검색')),
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
  String imageURL = 'assets/images/' + foodName + '.jpg';
  return imageURL;
}

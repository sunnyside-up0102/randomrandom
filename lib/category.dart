import 'package:flutter/material.dart';
import 'package:youtube_ad2/provider/food_name.dart';
import 'package:youtube_ad2/provider/food_provider.dart';
import 'package:youtube_ad2/screen/home_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_ad2/screen/result_screen.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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

  List pressAttention = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  List selectedCategory = [];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('취향대로 골라주세요'),
          Text('ʕ•ﻌ•ʔ \u{2665}'),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              setState(() {
                pressAttention[11] = !pressAttention[11];
              });
              debugPrint(pressAttention[11].toString());
              (pressAttention[11])
                  ? selectedCategory.remove('아무거나')
                  : selectedCategory.add('아무거나');
              debugPrint(selectedCategory.toString());
              context.read<Category>().addCategory(kor);
            },
            style: ElevatedButton.styleFrom(
              primary: (pressAttention[11]) ? Colors.red : Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text(' \u{1f374} 아무거나 '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[0] = !pressAttention[0];
                  });
                  debugPrint(pressAttention[0].toString());
                  (pressAttention[0])
                      ? selectedCategory.remove('한식')
                      : selectedCategory.add('한식');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(kor)
                      : context.read<Category>().addCategory(kor);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[0]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35a} 한식 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[1] = !pressAttention[1];
                  });
                  debugPrint(pressAttention[1].toString());
                  (pressAttention[1])
                      ? selectedCategory.remove('양식')
                      : selectedCategory.add('양식');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(eu)
                      : context.read<Category>().addCategory(eu);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[1]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35d} 양식 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[2] = !pressAttention[2];
                  });
                  debugPrint(pressAttention[2].toString());
                  (pressAttention[2])
                      ? selectedCategory.remove('중식')
                      : selectedCategory.add('중식');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(chn)
                      : context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[2]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f376} 중식 '),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[3] = !pressAttention[3];
                  });
                  debugPrint(pressAttention[3].toString());
                  (pressAttention[3])
                      ? selectedCategory.remove('아시안')
                      : selectedCategory.add('아시안');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(asia)
                      : context.read<Category>().addCategory(asia);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[3]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f372} 아시안 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[4] = !pressAttention[4];
                  });
                  debugPrint(pressAttention[4].toString());
                  (pressAttention[4])
                      ? selectedCategory.remove('일식')
                      : selectedCategory.add('일식');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(jpn)
                      : context.read<Category>().addCategory(jpn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[4]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f363} 일식 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[5] = !pressAttention[5];
                  });
                  debugPrint(pressAttention[5].toString());
                  (pressAttention[5])
                      ? selectedCategory.remove('브런치')
                      : selectedCategory.add('브런치');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(brunch)
                      : context.read<Category>().addCategory(brunch);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[5]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35e} 브런치 '),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[6] = !pressAttention[6];
                  });
                  debugPrint(pressAttention[6].toString());
                  (pressAttention[6])
                      ? selectedCategory.remove('면')
                      : selectedCategory.add('면');
                  debugPrint(selectedCategory.toString());
                  context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[6]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35c} 면 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[7] = !pressAttention[7];
                  });
                  debugPrint(pressAttention[7].toString());
                  (pressAttention[7])
                      ? selectedCategory.remove('고기')
                      : selectedCategory.add('고기');
                  debugPrint(selectedCategory.toString());
                  context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[7]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f356} 고기 '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[8] = !pressAttention[8];
                  });
                  debugPrint(pressAttention[8].toString());
                  (pressAttention[8])
                      ? selectedCategory.remove('밥')
                      : selectedCategory.add('밥');
                  debugPrint(selectedCategory.toString());
                  context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[8]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f359} 밥 '),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[9] = !pressAttention[9];
                  });
                  debugPrint(pressAttention[9].toString());
                  (pressAttention[9])
                      ? selectedCategory.remove('가벼운')
                      : selectedCategory.add('가벼운');
                  debugPrint(selectedCategory.toString());
                  context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[9]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35f} 가벼운 '),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[10] = !pressAttention[10];
                  });
                  debugPrint(pressAttention[10].toString());
                  (pressAttention[10])
                      ? selectedCategory.remove('글루텐 없는')
                      : selectedCategory.add('글루텐 없는');
                  debugPrint(selectedCategory.toString());
                  context.read<Category>().addCategory(chn);
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[10]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text('\u{274e} 글루텐 없는'),
              ),
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              if (selectedCategory.isNotEmpty && isLoaded) {
                interstitialAd!.show();
                List foodCategory = context.read<Category>().category;
                context.read<FoodResult>().selectFood(foodCategory);
                Get.to(() => ResultScreen());
                print(foodCategory.toString());
              } else {
                null;
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text('\u{2705} 선택 완료'),
          ),
          SizedBox(height: 10),
          Text(
            ((selectedCategory.isEmpty) ? '하나 이상의 항목을 골라주세요' : ''),
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}

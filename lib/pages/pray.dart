import 'package:azkar_2/utilities/adhelper.dart';
import 'package:azkar_2/utilities/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';
import 'counter1.dart';

class Pray extends StatefulWidget {
  @override
  _PrayState createState() => _PrayState();
}

class _PrayState extends State<Pray> {
  List<String> pAzkar = [
    "أَسْـتَغْفِرُ الله.\n ثلاث مرات",
    "اللّهُـمَّ أَنْـتَ السَّلامُ، وَمِـنْكَ السَّلام، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام.\n مرة واحدة",
    "لا إلهَ إلاّ اللّهُ وحدَهُ لا شريكَ لهُ، لهُ المُـلْكُ ولهُ الحَمْد، وهوَ على كلّ شَيءٍ قَدير.\n مرة واحدة",
    "اللّهُـمَّ لا مانِعَ لِما أَعْطَـيْت، وَلا مُعْطِـيَ لِما مَنَـعْت، وَلا يَنْفَـعُ ذا الجَـدِّ مِنْـكَ الجَـد.\n مرة واحدة",
    "لا إلهَ إلاّ اللّه, وحدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمد، وهوَ على كلّ شيءٍ قدير.\n مرة واحدة",
    "لا حَـوْلَ وَلا قـوَّةَ إِلاّ بِاللهِ ، لا إلهَ إلاّ اللّـه، وَلا نَعْـبُـدُ إِلاّ إيّـاه, لَهُ النِّعْـمَةُ وَلَهُ الفَضْل وَلَهُ الثَّـناءُ الحَـسَن.\n مرة واحدة",
    "لا إلهَ إلاّ اللّهُ مخْلِصـينَ لَـهُ الدِّينَ وَلَوْ كَـرِهَ الكـافِرون.\n مرة واحدة",
    "سبحان الله.\n ثلاث وثلاثون مرة",
    "الحمد الله.\n ثلاث وثلاثون مرة",
    "الله اكبر.\n ثلاث وثلاثون مرة",
    "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ ، لهُ الملكُ ولهُ الحَمْد ، وهُوَ على كُلّ شَيءٍ قَـدير.\n ثلاث مرات بعد صلاتي الفجر والمغرب. ومرة بعد الصلوات الأخرى",
    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\"قُلْ هُوَ ٱللَّهُ أَحَدٌ ، ٱللَّهُ ٱلصَّمَدُ ، لَمْ يَلِدْ وَلَمْ يُولَدْ ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.\".\nثلاث مرات بعد صلاتي الفجر والمغرب. ومرة بعد الصلوات الأخرى.",
    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\"قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ ، مِن شَرِّ مَا خَلَقَ ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.ٌۢ.\".\nثلاث مرات بعد صلاتي الفجر والمغرب. ومرة بعد الصلوات الأخرى.",
    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\n\"قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ ، مَلِكِ ٱلنَّاسِ ، إِلَٰهِ ٱلنَّاسِ ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.ٌۢ\".\nثلاث مرات بعد صلاتي الفجر والمغرب. ومرة بعد الصلوات الأخرى.",
    "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\n\"للّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.ٌۢ\"\n[آية الكرسى - البقرة 255]مرة واحدة.",
    "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ.\n مرة واحدة",
  ];
  List<int> num = [3, 1, 1, 1, 1, 1, 1, 33, 33, 33, 3, 3, 3, 3, 3, 1];
  int count = 0;

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.banner_pray,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('الأذكار بعد الصلاة'),
              num[count] != 1
                  ? IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              child: MyCounter1(
                                innerCount: num[count],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.play_circle_outline,
                        color: Colors.red,
                      ))
                  : Container()
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.home_outlined),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
        ),
        endDrawer: MyDrawer(),
        body: PageView.builder(
            itemCount: pAzkar.length,
            onPageChanged: (int page) {
              setState(() {
                count = page;
              });
            },
            itemBuilder: (context, int index) {
              return Container(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: Text(
                                pAzkar[index],
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Theme.of(context).primaryColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          if (_isBannerAdReady)
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: _bannerAd.size.width.toDouble(),
                                height: _bannerAd.size.height.toDouble(),
                                child:
                                    index == 0 ? AdWidget(ad: _bannerAd) : null,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.95),
                      child: new LinearPercentIndicator(
                        isRTL: true,
                        width: MediaQuery.of(context).size.width,
                        animation: true,
                        lineHeight: 5.0,
                        animationDuration: 222,
                        percent: index / (pAzkar.length - 1),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.teal,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

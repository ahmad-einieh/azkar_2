import 'package:azkar_2/utilities/adhelper.dart';
import 'package:azkar_2/utilities/drawer.dart';
import 'package:azkar_2/utilities/svgFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
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
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            icon: Icon(Icons.home_outlined),
          ),
        ),
        endDrawer: MyDrawer(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: Center(
                        child: Text(
                      "احمد عينية",
                      style: TextStyle(fontSize: 35,color: Theme.of(context).primaryColor),
                    )),
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Row(
                      children: [
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextButton(
                              onPressed: () {
                                Clipboard.setData(new ClipboardData(
                                    text: "ahmad.ainieh2@gmail.com"));
                              },
                              child: SvgPicture.asset(email)),
                        ),
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextButton(
                            onPressed: () =>
                                _launchURL('https://github.com/ahmad-prog'),
                            child: SvgPicture.asset(github),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Share.share(
                                'https://drive.google.com/drive/folders/1JPkvynRKqheUHR26W8Y95TYTZEkGwlyz?usp=sharing');
                          },
                          child: Text("مشاركة"),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () => _launchURL(
                              'https://paypal.me/proahmad?locale.x=ar_EG'),
                          child: Text("باي بال"),
                        ),
                      ),
                    ]),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            if (_isBannerAdReady)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _launchURL(link) async {
    //const url = link;
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}

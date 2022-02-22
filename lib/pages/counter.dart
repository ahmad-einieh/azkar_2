import 'package:azkar_2/main.dart';
import 'package:azkar_2/utilities/adhelper.dart';
import 'package:azkar_2/utilities/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vibration/vibration.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  increment() {
    setState(() {
      count++;
    });
  }

  reset() {
    setState(() {
      count = 0;
    });
  }

  int? num;
  TextEditingController _textEditingController = TextEditingController();

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.banner_counter,
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
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId1,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Counter();
                  },
                ),
              );
            },
          );

          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color gColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
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
        body: Center(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    if (num != null && count + 1 == num!) {
                      if (await Vibration.hasAmplitudeControl()) {
                        Vibration.vibrate(amplitude: 128);
                      }
                    }
                    increment();
                  },
                  child: num == null || !(num! >= count)
                      ? Text(
                          "$count",
                          style: TextStyle(fontSize: 150, color: gColor),
                        )
                      : new CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width < 200
                              ? 116
                              : 222.0,
                          lineWidth: 7.0,
                          percent: count / num!,
                          center: new Text(
                            "$count",
                            style: TextStyle(fontSize: 35, color: gColor),
                          ),
                          progressColor: Theme.of(context).primaryColor,
                        ),
                ),
              ),
              Align(
                alignment: Alignment(-0.90, -0.90),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      reset();
                      setState(() {
                        num = null;
                      });
                    },
                    child: Icon(
                      Icons.settings_backup_restore,
                      //color: Colors.teal,
                    )),
              ),
              Align(
                alignment: Alignment(0.90, -0.90),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      primary: Theme.of(context).primaryColor,
                    ),
                    onLongPress: () {
                      if (_isInterstitialAdReady) _interstitialAd?.show();
                    },
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: gColor,
                            title: new Text(
                              "ادخل عدد التسبيحات",
                              style: TextStyle(color: Colors.white),
                            ),
                            content: new TextField(
                              controller: _textEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                //hoverColor: Colors.white,
                                //focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                ),
                                labelText: 'عدد التسبيحات',
                                labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              new TextButton(
                                child: new Text(
                                  "تم",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(num =
                                      int.parse(_textEditingController.text));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      //color: Colors.teal,
                    )),
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
      ),
    );
  }
}

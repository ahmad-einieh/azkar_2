import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-9942057001003051/9483257716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  /*static String get banner_home_page {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/2935828258';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/4813098271';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_additions {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/9147342376';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/5741970905';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_morning {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/4650953344';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/8207054978';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_evining {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/3884666580';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/3693094891';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_counter {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/8562278192';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/7057624838';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_pray {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/9719926125';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/6902191090';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_about {
    if (Platform.isAndroid) {
      return 'ca-app-pub-8109222512481156/3265843193';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-8109222512481156/8764941255';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }*/

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9942057001003051/8531809134";
    } else if (Platform.isIOS) {
      return "ca-app-pub-8109222512481156/3061543659";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  /*static String get interstitialAdUnitId1 {
    if (Platform.isAndroid) {
      return "ca-app-pub-8109222512481156/1602790622";
    } else if (Platform.isIOS) {
      return "ca-app-pub-8109222512481156/1411218938";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }*/
/*static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
  static String get interstitialAdUnitId1 {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get banner_about {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_home_page {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_additions {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_morning {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_evining {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_counter {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get banner_pray {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }*/
}

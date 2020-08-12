import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>[],
  contentUrl: 'https://flutter.io',
  // birthday: DateTime.now(),
  childDirected: false,
  // designedForFamilies: false,
  // gender:
  //   MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.banner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

class AdMobService {
  String getAdMobID() {
    if (Platform.isIOS)
      return '';
    else if (Platform.isAndroid)
      return 'ca-app-pub-4042459717874979~4514733659';
    return '';
  }

  String getBannerID() {
    if (Platform.isIOS)
      return '';
    else if (Platform.isAndroid)
      return 'ca-app-pub-4042459717874979/7603646012';
    return '';
  }

  Future showAd() async {
    await FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-4042459717874979/2278085570');
    await RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId, targetingInfo: targetingInfo);
  }
}

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:tomate_app/ad_manager.dart';

class BannerView extends StatefulWidget {
  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {

  @override
  void initState() {
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );
    //inicializa função de carregar banner
    _loadBannerAd();
  }

    BannerAd _bannerAd;
  // Implementa _loadBannerAd() para carregar e mostrar o banner
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

    Future<void> _initAdMob() {
    // Inicializa o AdMob SDK
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(0.0),
      color: Colors.greenAccent,
      child: SizedBox(width: double.infinity, height: 50.0),

    );
  }


  @override
  void dispose() {
    // Dispose no BannerAd
    _bannerAd?.dispose();
    super.dispose();
  }

}




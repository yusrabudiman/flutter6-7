import 'package:flutter/material.dart';

import 'package:flutter_application_1/pertemuan06/pertemuan06_provider.dart';
import 'package:flutter_application_1/pertemuan06/pertemuan06_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Pertemuan06Provider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: prov.enableDarkMode == true ? prov.dark : prov.light,
      home: Pertemuan06Screen(),
    );
  }
}

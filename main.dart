import 'package:flutter/material.dart';
import 'package:flutter_navigation/components/pertemuan07_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_navigation/components/pertemuan07_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Pertemuan07Provider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //gunakan "theme" ini untuk menerapkan enable dark sesuai topik materi minggu 06
      //theme: prov.isActive == ? prov.dark : prov.light,
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.purple),

      home: Pertemuan07Screen(),
    );
  }
}

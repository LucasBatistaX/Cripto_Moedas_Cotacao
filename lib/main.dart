import 'package:BlueChain/configs/app_settings.dart';
import 'package:BlueChain/configs/hive_config.dart';
import 'package:BlueChain/meu_aplicativo.dart';
import 'package:BlueChain/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start(); 

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository()),
      ],
      child: MeuAplicativo(),
    ),
  );
}

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/adapters.dart';

import 'package:kalyani_app/src/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('kalyani');

  runApp(const ProviderScope(child: KalyaniApp()));
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/app.dart';
import 'package:game_tv/core/providers/auth/token_storage.dart';
import 'package:game_tv/core/providers/dio_client.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        tokenProvider.overrideWith((ref) => prefs.getString('auth_token')),
      ],
      child: App(),
    ),
  );
}

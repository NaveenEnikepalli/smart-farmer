#!/usr/bin/env dart

/// Environment Switcher Script
/// 
/// This script helps you quickly switch between development and production
/// environments in the Flutter app.
/// 
/// Usage:
/// dart scripts/switch_env.dart dev    # Switch to development
/// dart scripts/switch_env.dart prod   # Switch to production

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Please specify environment: dev or prod');
    print('Usage: dart scripts/switch_env.dart [dev|prod]');
    exit(1);
  }

  final environment = args[0].toLowerCase();
  
  if (environment != 'dev' && environment != 'prod') {
    print('❌ Invalid environment. Use: dev or prod');
    exit(1);
  }

  final configFile = File('lib/config/api_config.dart');
  if (!configFile.existsSync()) {
    print('❌ Config file not found: lib/config/api_config.dart');
    exit(1);
  }

  String content = configFile.readAsStringSync();
  
  if (environment == 'dev') {
    content = content.replaceAll(
      'static const bool isDev = false;',
      'static const bool isDev = true;',
    );
    print('✅ Switched to DEVELOPMENT environment');
    print('   Backend: http://192.168.29.152:5000');
  } else {
    content = content.replaceAll(
      'static const bool isDev = true;',
      'static const bool isDev = false;',
    );
    print('✅ Switched to PRODUCTION environment');
    print('   Backend: https://myapp-backend.onrender.com');
  }

  configFile.writeAsStringSync(content);
  print('📝 Updated: lib/config/api_config.dart');
  print('🔄 Run: flutter clean && flutter pub get');
}

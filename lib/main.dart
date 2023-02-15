import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_firestore_first/firebase_options.dart';

import 'app.dart';
import 'firestore/services/analytics_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

  AnalyticsService().updateAnalytics(field: 'total_access');
}

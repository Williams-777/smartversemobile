import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorage {
  OnboardingStorage._();
  static final OnboardingStorage instance = OnboardingStorage._();

  static const _seenKey = 'has_seen_onboarding';

  bool _hasSeen = false;
  bool get hasSeenOnboarding => _hasSeen;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _hasSeen = prefs.getBool(_seenKey) ?? false;
  }

  Future<void> markSeen() async {
    _hasSeen = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenKey, true);
  }
}
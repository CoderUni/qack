// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum TimeOfTheDay {
  morning,
  afternoon,
  evening,
}

/// Provides extension methods to [DateTime] object
extension DateTimeExtension on DateTime {
  TimeOfTheDay get toTimeOfTheDay {
    final hour = this.hour;

    if (hour >= 5 && hour < 12) {
      return TimeOfTheDay.morning;
    } else if (hour >= 12 && hour < 18) {
      return TimeOfTheDay.afternoon;
    }

    return TimeOfTheDay.evening;
  }
}

extension TimeOfDayExtension on TimeOfTheDay {
  LinearGradient get gradient {
    switch (this) {
      case TimeOfTheDay.morning:
        return const LinearGradient(
          colors: [
            Color(0xFFEF6820),
            Color(0xFFFF9C66),
          ],
        );
      case TimeOfTheDay.afternoon:
        return const LinearGradient(
          colors: [
            Color(0xFFEF6820),
            Color(0xFFF38744),
          ],
        );
      case TimeOfTheDay.evening:
        return const LinearGradient(
          colors: [
            Color(0xFF155EEF),
            Color(0xFF2970FF),
          ],
        );
    }
  }

  Icon getIcon(double iconSize) {
    switch (this) {
      case TimeOfTheDay.morning:
        return Icon(
          Icons.light_mode,
          size: iconSize,
          color: const Color(0xFFFDE272),
        );
      case TimeOfTheDay.afternoon:
        return Icon(
          Icons.light_mode,
          size: iconSize,
          color: const Color(0xFFFDE272),
        );
      case TimeOfTheDay.evening:
        return Icon(
          Icons.bedtime_rounded,
          size: iconSize,
          color: const Color(0xFFFCFCFD),
        );
    }
  }

  String getGreeting(String username) {
    switch (this) {
      case TimeOfTheDay.morning:
        return 'Good morning, $username';
      case TimeOfTheDay.afternoon:
        return 'Good afternoon, $username';
      case TimeOfTheDay.evening:
        return 'Good evening, $username';
    }
  }
}

class DateTimeSerializer implements JsonConverter<DateTime, String> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(String timestamp) => DateTime.parse(timestamp);

  // Convert DateTime to UTC TIME ISO8601 string
  @override
  String toJson(DateTime date) => date.toUtc().toIso8601String();
}

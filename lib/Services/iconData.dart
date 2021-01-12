import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';




  IconData getIconFromName(String iconName) {
    switch (iconName) {
      case 'Clouds':
        {
          return WeatherIcons.cloudy;
        }
        break;

      case 'Clear':
        {
          return WeatherIcons.day_sunny;
        }
        break;

      case 'Mist':
        {
          return WeatherIcons.meteor;
        }
        break;

      case 'Rain':
        {
          return WeatherIcons.day_rain;
        }
        break;


      default:
        {
          return Icons.wb_auto;
        }
    }
  }

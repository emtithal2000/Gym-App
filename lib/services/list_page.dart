import 'package:first_app/navigations/buy.dart';
import 'package:first_app/navigations/exercise.dart';
import 'package:first_app/navigations/home_page.dart';
import 'package:first_app/navigations/profile.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  Buy(),
  const HomePage(),
  const Exercise(),
  const Profile(),
];

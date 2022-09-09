import 'package:flutter/material.dart';
import 'package:monews/model/news_agency_model.dart';
import 'package:monews/model/news_hot_model.dart';

Color main_red = const Color(0xffFF033E);
Color main_black = const Color(0xff1C1F2E);
Color light_red = const Color(0xffFFCDD8);
Color main_grey = const Color(0xffBFC3C8);
Color back_color = const Color(0xffF5F5F5);
Color white = const Color(0xffFAFAFA);

String news_agency02 =
    "https://cdn01.zoomit.ir/Avatars//b2e3b3fc-eb1c-47de-a3af-f43458f964d6.jpg?w=120";

List<String> defaultGrouping = [
  "ورزشی",
  "لژیونر ها",
  "فوتبال اروپا",
];

List<NewsAgencyModel> listNewsAgency = [
  NewsAgencyModel(
      name: "خبرگزاری آخرین خبر",
      description: "آخرین خبر های فوری و مهم",
      icon: "assets/images/news_agency01.png"),
  NewsAgencyModel(
      name: "خبرگزاری زومیت",
      description: "پایگاه خبری در زمینه فناوری",
      icon: "assets/images/news_agency02.png"),
  NewsAgencyModel(
      name: "خبرگزاری ورزش سه",
      description: "پایگاه اطلاع رسانی ورزشی",
      icon: "assets/images/news_agency03.png"),
  NewsAgencyModel(
      name: "خبرگزاری دیجیاتو",
      description: "مرجع اخبار فناوری",
      icon: "assets/images/news_agency04.png"),
];

List<NewsHotModel> newsHot = [
  NewsHotModel(
      title: "حمله گلر جنجالی به یاغی پرسپولیس",
      description:
          "خبر ورزشی/ حامد لک گلر سابق پرسپولیس جواب مهدی هاشمی نسب را داد و او را مقصر حواشی به وجود آمده در بازی مس رفسنجان و فولاد دانست.",
      Grouping: "ورزشی",
      image: "assets/images/new_hot_01.jpg",
      newsAgency: listNewsAgency[0]),
  NewsHotModel(
      title: "title",
      description: "",
      Grouping: "",
      image: "assets/images/new_hot_01.jpg",
      newsAgency: listNewsAgency[1]),
  NewsHotModel(
      title: "title",
      description: "",
      Grouping: "",
      image: "assets/images/new_hot_01.jpg",
      newsAgency: listNewsAgency[2]),
  NewsHotModel(
      title: "title",
      description: "",
      Grouping: "",
      image: "assets/images/new_hot_01.jpg",
      newsAgency: listNewsAgency[3]),
  NewsHotModel(
      title: "title",
      description: "",
      Grouping: "",
      image: "assets/images/new_hot_01.jpg",
      newsAgency: listNewsAgency[1]),
];

import 'package:monews/model/news_agency_model.dart';

class NewsHotModel {
  String? title;
  String? description;
  String? Grouping;
  String? image;
  NewsAgencyModel? newsAgency;

  NewsHotModel({required this.title,required this.description,required this.Grouping,required this.image,required this.newsAgency});
}

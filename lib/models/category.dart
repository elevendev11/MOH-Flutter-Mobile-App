import 'package:sa_cooperation/utils/icon_util.dart';

class Category {
  String thumbnail;
  String name;

  Category({
    required this.name,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Happiness',
    thumbnail: happinessIcon,
  ),
  Category(
    name: 'Success Index',
    thumbnail: successIndexIcon,
  ),
  Category(
    name: 'Personal Evaluation',
    thumbnail: personalEvaluationIcon,
  ),
  Category(
    name: 'Know Yourself',
    thumbnail: knowYourselfIcon,
  ),
];

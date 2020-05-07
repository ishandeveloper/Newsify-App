import 'package:news_app/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = 'COVID-19';
  categoryModel.imageURL =
      'https://github.com/ishandeveloper/Newsify-App/blob/master/assets/hostedImages/covid19.jpg?raw=false';
  category.add(categoryModel);

  // 2
  categoryModel.categoryName = 'Business';
  categoryModel.imageURL =
      'https://github.com/ishandeveloper/Newsify-App/blob/master/assets/hostedImages/business.jpg?raw=false';
  category.add(categoryModel);

  // 3
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageURL =
      'https://github.com/ishandeveloper/Newsify-App/blob/master/assets/hostedImages/entertainment.jpeg?raw=false';
  category.add(categoryModel);

  // 4
  categoryModel.categoryName = 'General';
  categoryModel.imageURL =
      'https://github.com/ishandeveloper/Newsify-App/blob/master/assets/hostedImages/general.jpg?raw=false';
  category.add(categoryModel);

  return category;

}

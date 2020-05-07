import 'package:Newsify/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = List<CategoryModel>();
  CategoryModel categoryModel;

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageURL = "assets/hostedImages/general.jpg";
  myCategories.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "COVID-19";
  categoryModel.imageURL = "assets/hostedImages/covid19.jpg";
  myCategories.add(categoryModel);
  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL = "assets/hostedImages/business.jpg";
  myCategories.add(categoryModel);

  //4

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL = "assets/hostedImages/entertainment.jpg";
  myCategories.add(categoryModel);

  //5

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL = "assets/hostedImages/tech.jpg";
  myCategories.add(categoryModel);
  return myCategories;
}

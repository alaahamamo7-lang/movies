class CategoryModel {
  String categoryName;
  CategoryModel({required this.categoryName});
  static List<CategoryModel> categories = [
    CategoryModel(categoryName: "Action"),
    CategoryModel(categoryName: "Animated"),
    CategoryModel(categoryName: "Adventure"),
  ];
}

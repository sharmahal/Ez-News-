import 'package:news/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category= List<CategoryModel>(); //list of objects
  CategoryModel categoryModel= CategoryModel(); //object

  //1
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  //add this to list of Category models
  category.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl= "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageUrl= "https://images.unsplash.com/photo-1562077772-3bd90403f7f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";

  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageUrl= "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";

  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.imageUrl= "https://images.unsplash.com/photo-1516339901601-2e1b62dc0c45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";

  category.add(categoryModel);



  return category;


}
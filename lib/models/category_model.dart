import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({this.categoryName, this.imageURL});

  final String categoryName;
  final String imageURL;

  List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [
      CategoryModel(
          categoryName: 'Business',
          imageURL:
              'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
      CategoryModel(
          categoryName: 'Entertainment',
          imageURL:
              'https://images.unsplash.com/photo-1561114601-81d07393ee3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80'),
      CategoryModel(
          categoryName: 'Health',
          imageURL:
              'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80'),
      CategoryModel(
          categoryName: 'Science',
          imageURL:
              'https://images.unsplash.com/photo-1518152006812-edab29b069ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
      CategoryModel(
          categoryName: 'Sports',
          imageURL:
              'https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
      CategoryModel(
          categoryName: 'Technology',
          imageURL:
              'https://images.unsplash.com/photo-1517976487492-5750f3195933?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'),
    ];

    return categories;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  List<String> getCategoriesName() {
    List<String> categoriesName = [
      'Business',
      'Entertainment',
      'Health',
      'Science',
      'Sports',
      'Technology'
    ];
    return categoriesName;
  }
}

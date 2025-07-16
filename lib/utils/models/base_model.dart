import 'package:dolap_app_clone/utils/models/product_model.dart';

class BaseModel {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  BaseModel({this.products, this.total, this.skip, this.limit});

  BaseModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

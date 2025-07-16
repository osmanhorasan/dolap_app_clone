import 'package:dolap_app_clone/utils/constants/api_constants.dart';
import 'package:dolap_app_clone/utils/models/base_model.dart';
import 'package:dolap_app_clone/utils/models/category_list_model.dart';
import 'package:dolap_app_clone/utils/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final String path = "products";

  Future<BaseModel> getProducts([String? query]) async {
    try {
      final response = await http.get(Uri.parse("$baseURL/$path?$query"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final baseModel = BaseModel.fromJson(data);
        if (baseModel.products != null && baseModel.products!.isNotEmpty) {
          final firstProduct = baseModel.products![0];
          if (firstProduct.category != null) {
            print("category: ${firstProduct.category}");
          } else {
            print("category alanı null");
          }
        } else {
          print("products listesi boş veya null");
        }
        return BaseModel.fromJson(data);
      } else {
        // Hatalı durumlarda boş BaseModel döndür
        return BaseModel();
      }
    } catch (e) {
      print("Hata oluştu: $e");
      // Hata oluşursa boş BaseModel döndür
      return BaseModel();
    }
  }

  Future<BaseModel> getProductsSearch([String? query]) async {
    try {
      final response = await http.get(
        Uri.parse("$baseURL/$path/search?$query"),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final baseModel = BaseModel.fromJson(data);
        if (baseModel.products != null && baseModel.products!.isNotEmpty) {
          final firstProduct = baseModel.products![0];
          if (firstProduct.category != null) {
            print("category: ${firstProduct.category}");
          } else {
            print("category alanı null");
          }
        } else {
          print("products listesi boş veya null");
        }
        return BaseModel.fromJson(data);
      } else {
        // Hatalı durumlarda boş BaseModel döndür
        return BaseModel();
      }
    } catch (e) {
      print("Hata oluştu: $e");
      // Hata oluşursa boş BaseModel döndür
      return BaseModel();
    }
  }

  Future<CategoryListModel> getProductsCategoryList() async {
    try {
      final response = await http.get(
        Uri.parse("$baseURL/$path/category-list"),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return CategoryListModel.fromJson(data);
      } else {
        // Hatalı durumlarda boş CategoryListModel döndür
        return CategoryListModel(categories: []);
      }
    } catch (e) {
      print("Hata oluştu: $e");
      // Hata oluşursa boş CategoryListModel döndür
      return CategoryListModel(categories: []);
    }
  }

  Future<ProductModel?> getProductById(int id) async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products/$id"),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return ProductModel.fromJson(data);
      } else {
        print("Ürün bulunamadı veya hata oluştu: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Hata oluştu: $e");
      return null;
    }
  }
}

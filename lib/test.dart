import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class Repo {
  static String baseUrl = "https://api.escuelajs.co/api/v1/products";
  static String uplaodUrl = "https://api.escuelajs.co/api/v1/products";

  static Future<Response?> getAllProducts() async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<Response?> productUpdate(String title, double price,
      String description, int id, List<XFile> images) async {
    try {
      print(title);
      print(price);
      print(description);
      print(id);
      print(images);
      final url = Uri.parse(uplaodUrl);
      Map<String, dynamic> body = {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": id,
        "images": images,
      };
      final response = await post(url, body: body);
      if (response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
//////////////////////////////////////////////
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/model/product_model.dart';
import 'package:test_app/repository/product_repo.dart';

class Controler extends GetxController {
  RxList<ProductModel> prodctsList = <ProductModel>[].obs;
  Controler() {
    getdata();
  }

  Future<void> getdata() async {
    try {
      final response = await Repo.getAllProducts();

      if (response != null && response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        //===================first  way============================
        for (var data in jsondata) {
          prodctsList.add(ProductModel.fromJson(data));
        }

        // =====================secound way=======================
        // List<ProductModel> products = (json.decode(response.body) as List)
        //     .map((data) => ProductModel.fromJson(data))
        //     .toList();
        //prodctsList.value = products;

        //========================third way======================
        // List<ProductModel> plist = jsondata
        //     .map<ProductModel>((data) => ProductModel.fromJson(data))
        //     .toList();
        //  prodctsList.addAll(plist);

        //=========================4th way==========================
        // Using List.from and map to convert jsonData into a list of ProductModel
        // List<ProductModel> plist =
        //     List.from(jsondata.map((data) => ProductModel.fromJson(data)));
        // prodctsList.value = plist;

        //============================easiest way==================
        // List<ProductModel> plist = productModelFromJson(response.body);
        // prodctsList.value = plist;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  uploadData(String title, double price, String description, int id,
      List<XFile> images) async {
    final response =
        await Repo.productUpdate(title, price, description, id, images);
    if (response!.statusCode == 200) {
      print("successfully uploaded");
    }
  }
}

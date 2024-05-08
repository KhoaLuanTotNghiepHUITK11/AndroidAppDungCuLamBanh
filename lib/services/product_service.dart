import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://localhost:7249/api/dungcu'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.image =
          'https://royalarcadenorwich.co.uk/wp-content/uploads/2017/07/150x150.png'});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_DungCu'],
      name: json['tenDungCu'],
      price: json['gia'].toDouble(),
      image: json['hinhAnh'] ??
          'https://royalarcadenorwich.co.uk/wp-content/uploads/2017/07/150x150.png',
    );
  }
}

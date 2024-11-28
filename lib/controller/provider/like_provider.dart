import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LikedProductsProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _likedProducts = [];
  late Database _database;

  List<Map<String, dynamic>> get likedProducts => _likedProducts;

  int get likedProductsCount => _likedProducts.length; // Count of liked products

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'liked_products.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE liked_products(id TEXT PRIMARY KEY, imageUrl TEXT, title TEXT)',
        );
      },
      version: 1,
    );
    await fetchLikedProducts();
  }

  Future<void> fetchLikedProducts() async {
    final List<Map<String, dynamic>> products = await _database.query('liked_products');
    _likedProducts = products.isNotEmpty ? products : [];
    notifyListeners();  // Notify listeners to update UI
  }

  Future<void> toggleLike(Map<String, dynamic> product) async {
    final productId = product['id'];
    final existingProduct = _likedProducts.firstWhere(
      (p) => p['id'] == productId, 
      orElse: () => {},
    );

    if (existingProduct.isEmpty) {
      // Add to favorites
      await _database.insert(
        'liked_products', 
        product,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      // Remove from favorites
      await _database.delete(
        'liked_products', 
        where: 'id = ?', 
        whereArgs: [productId],
      );
    }

    await fetchLikedProducts(); // Fetch updated list after toggle
  }

  bool isLiked(String id) {
    return _likedProducts.any((product) => product['id'] == id);
  }
}

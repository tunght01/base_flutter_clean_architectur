import 'package:hive_ce/hive.dart';
import 'package:uuid/uuid.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final bool inStock;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final String createdAt;
  @HiveField(6)
  final String updatedAt;

  ProductHiveModel({
    String? id,
    required this.name,
    required this.price,
    required this.inStock,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  }) : id = id ?? const Uuid().v4();

  static final defaultItems =   [
    ProductHiveModel(
      name: "Sản phẩm mẫu 1",
      price: 150000,
      inStock: true,
      description: "Đây là dữ liệu mồi mặc định",
      createdAt: '18/04/2026',
      updatedAt: '18/04/2026',
    ),
    ProductHiveModel(
      name: "Sản phẩm mẫu 2",
      price: 250000,
      inStock: false,
      description: "Đây là dữ liệu mồi mặc định",
      createdAt: '18/04/2026',
      updatedAt: '18/04/2026',
    ),
    ProductHiveModel(
      name: "Sản phẩm mẫu 3",
      price: 250000,
      inStock: false,
      description: "Đây là dữ liệu mồi mặc định",
      createdAt: '18/04/2026',
      updatedAt: '18/04/2026',
    ),
    ProductHiveModel(
      name: "Sản phẩm mẫu 4",
      price: 250000,
      inStock: false,
      description: "Đây là dữ liệu mồi mặc định",
      createdAt: '18/04/2026',
      updatedAt: '18/04/2026',
    ),
    ProductHiveModel(
      name: "Sản phẩm mẫu 5",
      price: 250000,
      inStock: false,
      description: "Đây là dữ liệu mồi mặc định",
      createdAt: '18/04/2026',
      updatedAt: '18/04/2026',
    ),
  ];
}

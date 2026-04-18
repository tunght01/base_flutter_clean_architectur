class ProductEntity {
  final String? id;
  final String name;
  final double price;
  final bool inStock;
  final String description;
  final String createdAt;
  final String updatedAt;

  ProductEntity({
    this.id,
    this.name = '',
    this.price = 0,
    this.inStock = false,
    this.description = '',
    this.createdAt = '',
    this.updatedAt = '',
  });
}

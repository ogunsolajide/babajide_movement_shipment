final List<ProductDetails> productList = [
  ProductDetails('Macbook pro M2', '#NEJ2001234567 • Paris → Morocco'),
  ProductDetails('Summer linen jacket', '#NEJ2001234545 • Barcelona → Paris'),
  ProductDetails('Tapered-fit jeans AW', '#NEJ2001234590 • Colombia → Paris'),
  // Add more items as needed
];
final List<String> categoryTypesList = [
  "Documents",
  "Glass",
  "Liquid",
  "Food",
  "Electronics",
  "Products",
  "Others"
];
class ProductDetails {
  final String title;
  final String description;

  ProductDetails(this.title, this.description);
}
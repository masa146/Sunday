class Medicine {
  String trade_name;
  int price;
  String image;
  int quantity;
  String? ScientificName;
  String? category;
  String? company;
  String? expirationDate;
  Medicine(
      {required this.trade_name,
        required this.ScientificName,
        required this.category,
        required this.company,
        required this.expirationDate,
        required this.price,
        required this.image,
        required this.quantity});
}

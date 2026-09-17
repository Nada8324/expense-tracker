class TransactionModel {
  final double amount;
  final String category;
  final String description;
  final String type;

  TransactionModel({
    required this.amount,
    required this.category,
    required this.description,
    required this.type,
  });
  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "category": category,
      "description": description,
      "type": type,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      amount: (json['amount'] as num).toDouble(),
      category: json['category'],
      description: json['description'],
      type: json['type'],
    );
  }
}

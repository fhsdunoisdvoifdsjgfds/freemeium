class Cash {
  Cash({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
  });

  int id;
  String title;
  int amount;
  String category;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
    };
  }

  factory Cash.fromMap(Map<String, dynamic> map) {
    return Cash(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      category: map['category'],
    );
  }
}

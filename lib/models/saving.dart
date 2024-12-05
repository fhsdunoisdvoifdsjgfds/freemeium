class Saving {
  Saving({
    required this.id,
    required this.category,
    required this.amount,
  });

  int id;
  String category;
  int amount;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
    };
  }

  factory Saving.fromMap(Map<String, dynamic> map) {
    return Saving(
      id: map['id'],
      category: map['category'],
      amount: map['amount'],
    );
  }
}

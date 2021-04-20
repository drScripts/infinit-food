part of 'models.dart';

enum TransactionStatus { delivered, onDelivery, pending, cancel }

class Transaction extends Equatable {
  final int id, quantity, total;
  final Food food;
  final DateTime time;
  final TransactionStatus status;
  final User user;
  final String url;

  Transaction({
    this.id,
    this.quantity,
    this.total,
    this.food,
    this.time,
    this.status,
    this.user,
    this.url,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      quantity: json['quantity'],
      total: json['total'],
      food: Food.fromJson(json['food']),
      time: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
      status: (json['status'] == 'PENDING')
          ? TransactionStatus.pending
          : (json['status'] == 'DELIVERED')
              ? TransactionStatus.delivered
              : (json['status'] == 'CANCELED')
                  ? TransactionStatus.cancel
                  : TransactionStatus.onDelivery,
      url: json['payment_url'],
    );
  }

  Transaction copyWith({int id, int quantity, int total, Food food, DateTime time, TransactionStatus status, User user, String url}) {
    return Transaction(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      food: food ?? this.food,
      time: time ?? this.time,
      status: status ?? this.status,
      user: user ?? this.user,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [id, quantity, total, food, time, status, user];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 1,
    quantity: 10,
    total: (mockFoods[0].price * 10 * 1.1).round() + 50000,
    food: mockFoods[0],
    time: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    quantity: 12,
    total: (mockFoods[1].price * 12 * 1.1).round() + 50000,
    food: mockFoods[1],
    time: DateTime.now(),
    status: TransactionStatus.onDelivery,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    quantity: 13,
    total: (mockFoods[2].price * 13 * 1.1).round() + 50000,
    food: mockFoods[2],
    time: DateTime.now(),
    status: TransactionStatus.cancel,
    user: mockUser,
  ),
  Transaction(
    id: 4,
    quantity: 13,
    total: (mockFoods[3].price * 13 * 1.1).round() + 50000,
    food: mockFoods[3],
    time: DateTime.now(),
    status: TransactionStatus.pending,
    user: mockUser,
  ),
];

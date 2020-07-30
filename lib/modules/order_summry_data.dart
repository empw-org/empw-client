class OrderSummeryData {
  String id;
  String amount;
  String state;
  String total;

  OrderSummeryData({
    this.id,
    this.amount,
    this.state,
    this.total,
  });

  factory OrderSummeryData.fromJson(
      {Map<String, dynamic> returnedOrder, String total}) {
    return OrderSummeryData(
        id: returnedOrder["_id"],
        amount: returnedOrder["amount"],
        state: returnedOrder["state"],
        total: total);
  }
}

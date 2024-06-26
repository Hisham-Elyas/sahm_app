import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentCardModel {
  final String cardHolderFullName;
  final String cardNumber;
  final String cvvNumber;
  final String releseDate;
  final String expireDate;
  bool isDefault;
  PaymentCardModel({
    required this.cardHolderFullName,
    required this.cardNumber,
    required this.cvvNumber,
    required this.releseDate,
    required this.expireDate,
    this.isDefault = false,
  });

  PaymentCardModel copyWith({
    String? cardHolderFullName,
    String? cardNumber,
    String? cvvNumber,
    String? releseDate,
    String? expireDate,
    bool? isDefault,
  }) {
    return PaymentCardModel(
      cardHolderFullName: cardHolderFullName ?? this.cardHolderFullName,
      cardNumber: cardNumber ?? this.cardNumber,
      cvvNumber: cvvNumber ?? this.cvvNumber,
      releseDate: releseDate ?? this.releseDate,
      expireDate: expireDate ?? this.expireDate,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardHolderFullName': cardHolderFullName,
      'cardNumber': cardNumber,
      'cvvNumber': cvvNumber,
      'releseDate': releseDate,
      'expireDate': expireDate,
      'isDefault': isDefault,
    };
  }

  factory PaymentCardModel.fromMap(Map<String, dynamic> map) {
    return PaymentCardModel(
      cardHolderFullName: map['cardHolderFullName'] as String,
      cardNumber: map['cardNumber'] as String,
      cvvNumber: map['cvvNumber'] as String,
      releseDate: map['releseDate'] as String,
      expireDate: map['expireDate'] as String,
      isDefault: map['isDefault'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentCardModel.fromJson(String source) =>
      PaymentCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentCardModel(cardHolderFullName: $cardHolderFullName, cardNumber: $cardNumber, cvvNumber: $cvvNumber, releseDate: $releseDate, expireDate: $expireDate, isDefault: $isDefault)';
  }

  @override
  bool operator ==(covariant PaymentCardModel other) {
    if (identical(this, other)) return true;

    return other.cardHolderFullName == cardHolderFullName &&
        other.cardNumber == cardNumber &&
        other.cvvNumber == cvvNumber &&
        other.releseDate == releseDate &&
        other.expireDate == expireDate &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return cardHolderFullName.hashCode ^
        cardNumber.hashCode ^
        cvvNumber.hashCode ^
        releseDate.hashCode ^
        expireDate.hashCode ^
        isDefault.hashCode;
  }
}

class TaxiBookingSummaryModel {
  int? totalPrice;
  String? promoCode;
  int? discount;
  bool? inVoice;
  bool? individual;
  String? companyName;
  String? gender;
  String? fullName;

  TaxiBookingSummaryModel({this.totalPrice, this.discount, this.inVoice, this.promoCode, this.individual, this.companyName, this.gender, this.fullName});
}
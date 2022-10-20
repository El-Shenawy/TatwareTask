class ExpertData {
  List<ExpertItem>? expertItems;

  ExpertData({this.expertItems});
}

class ExpertItem {
  String? imageUrl;
  String? name;
  String? speciality;
  double? rate;
  bool? favourite;

  ExpertItem(
      {this.imageUrl, this.name, this.speciality, this.rate, this.favourite});
}

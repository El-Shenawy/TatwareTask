import 'package:task/models/experts.dart';

class ExpertDataProvider {
  Future<ExpertData> getShopItems() async {
    List<ExpertItem> expertItem = [
      ExpertItem(
        imageUrl: "assets/images/male.png",
        rate: 5.0,
        speciality: "Supply Chain",
        name: 'Karim Adel',
      ),
      ExpertItem(
        imageUrl: "assets/images/female.png",
        rate: 4.9,
        speciality: "Supply Chain",
        name: 'Merna Adel',
      ),
    ];
    return ExpertData(expertItems: expertItem);
  }
}

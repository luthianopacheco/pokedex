import 'package:hive/hive.dart';
import 'package:pokedex/shared/domain/models/gender.dart';

part 'gender_data.g.dart';

@HiveType(typeId: 2)
class GenderData extends HiveObject {
  @HiveField(0)
  double male;

  @HiveField(1)
  double female;

  GenderData({required this.male, required this.female});

  factory GenderData.fromJson(int? genderRate) {
    if (genderRate == -1 || genderRate == null) {
      return GenderData(male: 0, female: 0);
    }

    final femalePercent = genderRate * 12.5;
    final malePercent = 100 - femalePercent;

    return GenderData(male: malePercent, female: femalePercent);
  }

  Gender toDomain() {
    return Gender(male: male, female: female);
  }
}

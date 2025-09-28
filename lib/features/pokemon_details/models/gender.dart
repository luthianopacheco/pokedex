import 'package:hive/hive.dart';

part 'gender.g.dart';

@HiveType(typeId: 2)
class Gender extends HiveObject {
  @HiveField(0)
  double male;

  @HiveField(1)
  double female;

  Gender({required this.male, required this.female});

  factory Gender.fromJson(int? genderRate) {
    if (genderRate == -1 || genderRate == null) {
      return Gender(male: 0, female: 0);
    }

    final femalePercent = genderRate * 12.5;
    final malePercent = 100 - femalePercent;

    return Gender(male: malePercent, female: femalePercent);
  }
}

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'profile_controller.g.dart';

@lazySingleton
class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  @observable
  bool enableMegaEvolutions = false;

  @observable
  bool enableOtherForms = true;

  @observable
  bool notifyPokedexUpdates = true;

  @observable
  bool notifyPokemonWorld = true;

  @action
  void toggleMegaEvolutions(bool value) {
    enableMegaEvolutions = value;
  }

  @action
  void toggleOtherForms(bool value) {
    enableOtherForms = value;
  }

  @action
  void togglePokedexUpdates(bool value) {
    notifyPokedexUpdates = value;
  }

  @action
  void togglePokemonWorld(bool value) {
    notifyPokemonWorld = value;
  }
}

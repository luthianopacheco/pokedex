import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_controller.g.dart';

@injectable
class OnboardingController = OnboardingControllerBase
    with _$OnboardingController;

abstract class OnboardingControllerBase with Store {
  final pageController = PageController();

  @observable
  int currentPage = 0;

  OnboardingControllerBase() {
    pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    currentPage = pageController.page?.round() ?? 0;
  }

  @action
  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void dispose() {
    pageController.dispose();
  }
}

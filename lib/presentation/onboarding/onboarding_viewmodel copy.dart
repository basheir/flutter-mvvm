import 'dart:async';

import 'package:mvvm_project/domain/model.dart';
import 'package:mvvm_project/presentation/base/baseviewmodel.dart';
import 'package:mvvm_project/presentation/resources/strings_manager.dart';

import '../resources/assets_manager.dart';

class OnboardingViewmodel extends BaseViewModel
    with OnboardingViewmodelInput, OnboardingViewmodelOutput {
  // stream controllers
  final StreamController _streamController =
      StreamController<sliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void goNext() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex >= _list.length) {
      _currentIndex = 0; // infinite loop to the first inside the slider
    } else {
      _currentIndex = nextIndex;
    }
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  void onPrivious() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop to the length of the slider list
    } else {
      _currentIndex = previousIndex;
    }
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // Input methods
  @override
  Stream<SliderObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderObject) => sliderObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubtitle1, ImagesAsset.onboarding_Logo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubtitle2, ImagesAsset.onboarding_Logo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubtitle3, ImagesAsset.onboarding_Logo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubtitle4, ImagesAsset.onboarding_Logo4),
      ];

  _postDataToView() {
    inputSliderViewObject.add(
        sliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// This class will be used to define the input methods that will be used by the view
mixin OnboardingViewmodelInput {
  void start(); // when the view is initialized
  void goNext(); // when the user clicks on the next button or swipe to the left
  void
      onPrivious(); // when the user clicks on the privious button or swipe to the right
  void onPageChanged(int index); // when the user swipes to a specific page
  Sink get inputSliderViewObject; // input stream for the slider view object
}
// This class will be used to define the output methods that will be used by the view
mixin OnboardingViewmodelOutput {
  Stream<SliderObject>
      get outputSliderViewObject; // output stream for the slider view object
}

class sliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  sliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

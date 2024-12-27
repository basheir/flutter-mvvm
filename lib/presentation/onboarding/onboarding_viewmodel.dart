import 'package:mvvm_project/presentation/base/baseviewmodel.dart';

class OnboardingViewmodel  extends BaseViewModel with OnboardingViewmodelInput, OnboardingViewmodelOutput {

  // stream controllers
  
  // inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
  
  @override
  void onNext() {
    // TODO: implement onNext
  }
  
  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
  
  @override
  void onPrivious() {
    // TODO: implement onPrivious
  }
  
  
}


// This class will be used to define the input methods that will be used by the view
mixin OnboardingViewmodelInput {
  void onNext(); // when the user clicks on the next button or swipe to the left
  void onPrivious(); // when the user clicks on the privious button or swipe to the right 
  void onPageChanged(int index); // when the user swipes to a specific page
} 
// This class will be used to define the output methods that will be used by the view
mixin OnboardingViewmodelOutput {
}
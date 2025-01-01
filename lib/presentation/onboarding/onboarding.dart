import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/domain/model.dart';
import 'package:mvvm_project/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:mvvm_project/presentation/resources/assets_manager.dart';
import 'package:mvvm_project/presentation/resources/color_manager.dart';
import 'package:mvvm_project/presentation/resources/strings_manager.dart';
import 'package:mvvm_project/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  OnboardingViewmodel _viewmodel = OnboardingViewmodel();

  _bind() {
    _viewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<sliderViewObject>(
        stream: _viewmodel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(sliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewmodel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              // return onBoardingPage
              return OnboardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.primary,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),

              // Add layout for indicator and arrows
              _getButtomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getButtomSheetWidget(sliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAsset.leftArrowIc),
            ),
            onTap: () {
              // Go previous slide
              _pageController.animateToPage(_viewmodel.onPrivious(),
                  duration: const Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut);
            },
          ),
        ),

        // Circles indicator
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
              ),
          ],
        ),

        // Right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAsset.rightArrowIc),
            ),
            onTap: () {
              // Go next slide
              _pageController.animateToPage(_viewmodel.goNext(),
                  duration: const Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut);
            },
          ),
        )
      ],
    );
  }

  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImagesAsset.hollowCirlceIc); // Selected slider
    } else {
      return SvgPicture.asset(ImagesAsset.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
}

class OnboardingPage extends StatelessWidget {

final SliderObject _sliderObject;

OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        // Title here
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),

        //Subtitle here
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),

        // image here
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/presentation/resources/assets_manager.dart';
import 'package:mvvm_project/presentation/resources/color_manager.dart';
import 'package:mvvm_project/presentation/resources/strings_manager.dart';
import 'package:mvvm_project/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();

  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkPrimary,
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            // return onBoardingPage
            return OnboardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Add layout for indicator and arrows
            _getButtomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getButtomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAsset.leftArrowIc),
            ),
            onTap: () {
              // Go previous slide
              _pageController.animateToPage(_getPreviousIndex(),
                  duration: Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut);
            },
          ),
        ),

        // Circles indicator
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p12),
                child: _getProperCircle(i),
              ),
          ],
        ),

        // Right arrow
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImagesAsset.leftArrowIc),
            ),
            onTap: () {
              // Go next slide
               _pageController.animateToPage(_getPreviousIndex(),
                  duration: Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut);
            },
          ),
        )
      ],
    );
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop  to the length  of the slider list
    }
    return _currentIndex;
  }

  int _nextPreviousIndex() {
    int previousIndex = _currentIndex++;
    if (previousIndex >= _list.length) {
      _currentIndex = 0; // infinite loop  to the first inside the slider
    }
    return _currentIndex;
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImagesAsset.hollowCirlceIc); // Selected slider
    } else {
      return SvgPicture.asset(ImagesAsset.solidCircleIc);
    }
  }
}

class OnboardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnboardingPage(this._sliderObject, {super.key});

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
        SizedBox(
          height: AppSize.s60,
        ),

        // image here
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

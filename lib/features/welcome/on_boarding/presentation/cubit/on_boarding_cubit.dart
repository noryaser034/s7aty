import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ety/core/constants/app_images.dart';
import 'package:se7ety/features/welcome/on_boarding/data/models/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int currentPage = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: AppImages.onboarding1Svg,
      title: 'ابحث عن طبيب متخصص',
      body: 'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات الطبية.',
    ),
    OnBoardingModel(
      image: AppImages.onboarding2Svg,
      title: 'احجز موعدك بسهولة',
      body: 'قم بحجز مواعيدك الطبية بضغطة زر وبكل سهولة في أي وقت ومن أي مكان.',
    ),
    OnBoardingModel(
      image: AppImages.onboarding3Svg,
      title: 'آمن وسري',
      body: 'كن مطمئنا لأن بياناتك الصحية آمنة ومحمية بأعلى معايير الخصوصية.',
    ),
  ];

  int get totalPages => pages.length;

  bool get isLastPage => currentPage == totalPages - 1;

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingPageChanged(currentPage));
  }
}

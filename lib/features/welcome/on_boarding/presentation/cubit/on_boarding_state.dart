part of 'on_boarding_cubit.dart';

abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {
  final int pageIndex;
  OnBoardingPageChanged(this.pageIndex);
}

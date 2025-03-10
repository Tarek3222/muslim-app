class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  const OnBoardingModel(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingModel> onBoardingList = const [
  OnBoardingModel(
      image: 'assets/images/onboarding_1.png',
      title: 'حافظ علي التحفيز',
      description: 'استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن.'),
  OnBoardingModel(
      image: 'assets/images/onboarding_2.png',
      title: 'خطط مخصصة',
      description: 'ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار.'),
  OnBoardingModel(
      image: 'assets/images/onboarding_3.png',
      title: 'مرحباً!',
      description: 'ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك.'),
];

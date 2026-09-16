import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingColors {
  static const primaryOrange = Color(0xFFF2790A);
  static const title = Color(0xFF111111);
  static const subtitle = Color(0xFF6B7280);
  static const dotInactive = Color(0xFFE3E3E3);
}

class OnboardingPageData {
  final String imageAsset;
  final String title;
  final String description;
  final String buttonLabel;

  const OnboardingPageData({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.buttonLabel,
  });
}

const List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    imageAsset: 'assets/images/stop_guessing.png',
    title: 'Stop guessing.Start sizing.',
    description:
    'Smartvert calculates the exact inverter, battery, and solar panel setup '
        'for your home or business based on your actual appliances.',
    buttonLabel: 'Next',
  ),
  OnboardingPageData(
    imageAsset: 'assets/images/pick_appliances.png',
    title: 'Pick your appliances. ',
    description:
    'Select from 20+ common Nigerian home appliances across 5 categories. '
        'Each one has a pre-filled typical wattage you can edit to match your actual unit.',
    buttonLabel: 'Next',
  ),
  OnboardingPageData(
    imageAsset: 'assets/images/perfect_size.png',
    title: 'Get your perfect size.',
    description:
    'See your recommended inverter, battery, and solar panel sizes with a clear '
        'breakdown of every calculation, so you can understand your system and '
        'speak to any vendor with confidence.',
    buttonLabel: 'Start Sizing',
  ),
];

class OnboardingScreen extends StatefulWidget {
  final void Function(BuildContext context) onFinish;

  const OnboardingScreen({super.key, required this.onFinish});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == onboardingPages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    if (_isLastPage) {
      widget.onFinish(context);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  return _OnboardingPage(data: onboardingPages[index]);
                },
              ),
            ),
            _DotsIndicator(
              pageCount: onboardingPages.length,
              currentPage: _currentPage,
            ),
             SizedBox(height: 24.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: OnboardingColors.primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      onboardingPages[_currentPage].buttonLabel,
                      key: ValueKey(onboardingPages[_currentPage].buttonLabel),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;

  const _OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          const Spacer(flex: 2),
          SizedBox(
            height: 260.h,
            child: Image.asset(
              data.imageAsset,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Failed to load ${data.imageAsset}: $error');
                return SizedBox(
                  height: 260.h,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.broken_image_outlined,
                            size: 40.sp, color: Colors.redAccent),
                        SizedBox(height: 8.h),
                        Text(
                          'Missing: ${data.imageAsset}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11.sp, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
              color: OnboardingColors.title,
              height: 1.2,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              color: OnboardingColors.subtitle,
              height: 1.5,
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const _DotsIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            color: isActive
                ? OnboardingColors.primaryOrange
                : OnboardingColors.dotInactive,
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }
}
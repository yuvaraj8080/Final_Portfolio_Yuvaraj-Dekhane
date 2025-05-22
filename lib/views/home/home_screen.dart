import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/components/footer_content.dart';
import 'package:portfolio/views/home/components/projects_pages.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';
import '../../res/size_helpers.dart';
import '../responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: displayHeight(context),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left:30,right:30),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: [
                                  buildResponsiveSalutation(),
                                  const SizedBox(height: 20),
                                  buildResponsiveTitle(),
                                  const SizedBox(height:30),
                                  MediaAndResumeButton(),
                                ],
                              ),
                            ),
                            const SizedBox(width:80),
                            Expanded(
                              flex:4,
                              child: buildBannerSection(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:40),
                      buildResponsiveDescription(),
                    ],
                  ),
                ],
              ),
            ),
            const ProjectsPage(),
            const FooterContent(),
          ],
        ),
      ),
    );
  }

  Widget buildResponsiveSalutation() {
    return Responsive(
      desktop: buildSalutationText("Hi, I'm Yuvaraj Dekhane", 25),
      tablet: buildSalutationText("Hi, I'm Yuvaraj Dekhane", 25),
      mobile: buildSalutationText("Hi, I'm Yuvaraj Dekhane", 25),
    );
  }

  Widget buildSalutationText(String text, double fontSize) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: salutationTextStyle(fontSize),
      ),
    );
  }

  Widget buildResponsiveTitle() {
    return Responsive(
      desktop: buildTitleText("Flutter Developer", 20),
      tablet: buildTitleText("Flutter Developer", 20),
      mobile: buildTitleText("Flutter Developer", 20, isPadded: true),
    );
  }

  Widget buildTitleText(String text, double fontSize, {bool isPadded = false}) {
    return Padding(
      padding: isPadded
          ? const EdgeInsets.symmetric(horizontal: 32.0)
          : EdgeInsets.zero,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: titleText(fontSize),
          maxLines: 2,
        ),
      ),
    );
  }

  Widget buildResponsiveDescription() {
    return Responsive(
      desktop: buildDescriptionText(
        "Hi, I’m Yuvaraj Dekhane, a third-year Computer Science student at RGIT, Andheri (Mumbai University) and a passionate Flutter developer.\n"
            "Over the past two years, I’ve built 30+ cross-platform mobile apps using GetX, Provider, Bloc, and backend tools like Firebase, Supabase, and MongoDB.\n"
            "My work spans across social, business, safety, educational, and ML-powered domains, with 3 apps successfully published on the Google Play Store.\n"
            "I focus on creating scalable, intuitive, and impactful mobile solutions that solve real-world problems.",
      ),
      tablet: buildDescriptionText(
        "Hi, I’m Yuvaraj Dekhane, a third-year Computer Science student at RGIT, Andheri (Mumbai University) and a passionate Flutter developer.\n"
            "Over the past two years, I’ve built 30+ cross-platform mobile apps using GetX, Provider, Bloc, and backend tools like Firebase, Supabase, and MongoDB.\n"
            "My work spans across social, business, safety, educational, and ML-powered domains, with 3 apps successfully published on the Google Play Store.\n"
            "I focus on creating scalable, intuitive, and impactful mobile solutions that solve real-world problems.",
      ),
      mobile: buildDescriptionText(
        "Hi, I’m Yuvaraj Dekhane, a third-year Computer Science student at RGIT, Andheri (Mumbai University) and a passionate Flutter developer.\n"
            "Over the past two years, I’ve built 30+ cross-platform mobile apps using GetX, Provider, Bloc, and backend tools like Firebase, Supabase, and MongoDB.\n"
            "My work spans across social, business, safety, educational, and ML-powered domains, with 3 apps successfully published on the Google Play Store.\n"
            "I focus on creating scalable, intuitive, and impactful mobile solutions that solve real-world problems.",
      ),
    );
  }

  Widget buildDescriptionText(String text, {bool isPadded = false}) {
    return Padding(
      padding: isPadded
          ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)
          : const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: normalText(16),
        textAlign: TextAlign.left,
        softWrap: true,
      ),
    );
  }

}

class ScrollIndicator extends StatefulWidget {
  const ScrollIndicator({super.key});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: const Offset(0, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: _slideAnimation,
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: buttonColor,
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Scroll down to view projects',
          style: normalText(14).copyWith(
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

Widget buildBannerSection(BuildContext context) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Placeholder for your banner image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/project/Banner.jpg', // Replace with your banner image
              fit: BoxFit.cover,
            ),
          ),
          // Overlay gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

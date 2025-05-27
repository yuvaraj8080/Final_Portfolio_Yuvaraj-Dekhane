import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/components/footer_content.dart';
import 'package:portfolio/views/home/components/projects_pages.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';
import '../responsive.dart';
import 'components/banner_section.dart';

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
              child: Stack(
                children: [
                  buildResponsiveMainContent(context),
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

  Widget buildResponsiveMainContent(BuildContext context) {
    return Responsive(
      desktop: buildDesktopLayout(context),
      tablet: buildMobileLayout(context),
      mobile: buildMobileLayout(context),
    );
  }


  // Desktop Layout - Row layout with banner on right
  Widget buildDesktopLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildSalutationText("Hi, I'm Yuvaraj Dekhane", 25),
                    const SizedBox(height: 20),
                    buildTitleText("Flutter Developer", 20),
                    const SizedBox(height: 30),
                    MediaAndResumeButton(),
                  ],
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                flex: 4,
                child: buildBannerSection(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        buildDescriptionText(
          "Hi, I'm Yuvaraj Dekhane, a third-year Computer Science student at RGIT, Andheri (Mumbai University) and a passionate Flutter developer.\n"
              "Over the past two years, I've built 30+ cross-platform mobile apps using GetX, Provider, Bloc, and backend tools like Firebase, Supabase, and MongoDB.\n"
              "My work spans across social, business, safety, educational, and ML-powered domains, with 3 apps successfully published on the Google Play Store.\n"
              "I focus on creating scalable, intuitive, and impactful mobile solutions that solve real-world problems.",
        ),
      ],
    );
  }

  // Mobile Layout - Column layout (stacked vertically)
  Widget buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        // Banner Section at top for mobile
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildBannerSection(context),
        ),
        const SizedBox(height: 30),
        // Content below banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildSalutationText("Hi, I'm Yuvaraj Dekhane", 20),
              const SizedBox(height: 15),
              buildTitleText("Flutter Developer", 16),
              const SizedBox(height: 25),
              MediaAndResumeButton(),
            ],
          ),
        ),
        const SizedBox(height: 30),
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: buildDescriptionText(
            "Hi, I'm Yuvaraj Dekhane, a third-year Computer Science student at RGIT, Andheri (Mumbai University) and a passionate Flutter developer.\n"
                "Over the past two years, I've built 30+ cross-platform mobile apps using GetX, Provider, Bloc, and backend tools like Firebase, Supabase, and MongoDB.\n"
                "My work spans across social, business, safety, educational, and ML-powered domains, with 3 apps successfully published on the Google Play Store.\n"
                "I focus on creating scalable, intuitive, and impactful mobile solutions that solve real-world problems.",
            isPadded: true,
          ),
        ),
        const SizedBox(height: 20),
      ],
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

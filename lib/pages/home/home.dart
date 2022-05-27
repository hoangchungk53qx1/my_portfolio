import 'package:flutter/material.dart';
import 'package:my_portpolio/pages/home/components/experience_section.dart';

import '../../utils/constants.dart';
import '../../utils/globals.dart';
import 'components/carousel.dart';
import 'components/cv_section.dart';
import 'components/education_section.dart';
import 'components/footer.dart';
import 'components/header.dart';
import 'components/ios_app_ad.dart';
import 'components/portfolio_stats.dart';
import 'components/skill_section.dart';
import 'components/sponsors.dart';
import 'components/testimonial_widget.dart';
import 'components/website_ad.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            Carousel(),
            const SizedBox(
              height: 20.0,
            ),
            CvSection(),
            const IosAppAd(),
            const SizedBox(
              height: 70.0,
            ),
            const WebsiteAd(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              child: PortfolioStats(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const EducationSection(),
            const SizedBox(
              height: 50.0,
            ),
            const ExperienceSection(),
            const SizedBox(
              height: 50.0,
            ),
            const SkillSection(),
            const SizedBox(
              height: 50.0,
            ),
            // const Sponsors(),
            const SizedBox(
              height: 50.0,
            ),
            // const TestimonialWidget(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

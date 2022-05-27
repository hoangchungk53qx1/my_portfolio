import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../models/education.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description:
        "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
    linkName: "www.flutterpanda.com",
    period: "2019 - PRESENT",
  ),
  Education(
    description:
        "This is a sample education and details about it is stated below.This is a sample education and details about it is stated below",
    linkName: "www.flutterpanda.com",
    period: "2018 - 2019",
  ),
  Education(
    description:
        "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
    linkName: "www.flutterpanda.com",
    period: "2017 - 2018",
  ),
  Education(
    description:
        "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
    linkName: "www.flutterpanda.com",
    period: "2016 - 2017",
  ),
];

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 400.0),
                  child: const Text(
                    "A full stack all round developer that does all the job he needs to do at all times. Actually this is a false statement",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: educationList
                      .map(
                        (education) => SizedBox(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                education.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    education.linkName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

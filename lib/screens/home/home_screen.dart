import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/home/widgets/app_bar.dart';
import 'package:stylish/screens/home/widgets/search_bar.dart';

import 'widgets/dicount_cards.dart';
import 'widgets/featured_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // app bar
                const MyAppBar(),

                const SizedBox(height: 32),

                // search bar
                const MySearchBar(),

                const SizedBox(height: 32),

                // featured section
                const FeaturedSection(),

                const SizedBox(height: 16),

                // Discount Cards
                const DiscountCards(),

                const SizedBox(height: 40),

                // Deal of the day
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ).copyWith(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deal of the day',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/clock.svg",
                                  fit: BoxFit.none,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '22h 55m 20s remaining ',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 89,
                          height: 28,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'View all',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                ),
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const FlutterLogo(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

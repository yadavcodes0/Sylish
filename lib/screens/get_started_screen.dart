import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import "package:stylish/screens/login/widgets/buttons/button.dart";

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0, 1),
              end: const Alignment(0.00, -1.00),
              stops: const [0.0, 0.5],
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.3)
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: height * 0.65,
              left: width * 0.1,
              right: width * 0.1,
              bottom: height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  "You want Authentic, here you go!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: 0.34,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Find it here, buy it now!",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFFF2F2F2),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: 0.14,
                  ),
                ),
                const Spacer(),
                Button(
                  buttonName: "Get Started",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

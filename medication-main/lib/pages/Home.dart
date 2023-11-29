// ignore: file_names
import 'package:flutter/material.dart';
import 'package:medication/pages/BloodPressure.dart';
import 'package:medication/pages/BloodSugar.dart';
import 'package:medication/pages/Medicine.dart';
import 'package:google_fonts/google_fonts.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({Key? key}) : super(key: key);

  void navigateMediPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return const Medicine();
        },
      ),
    );
  }

  void navigateBloodPressure(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return BloodPressure();
        },
      ),
    );
  }

  void navigateBloodSugar(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return const BloodSugar();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE6E1C1),
        title: Text(
          'USER MENU',
          style:
              GoogleFonts.firaSans(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF9CBEC4),
              const Color(0xFF9CB6D9),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    navigateMediPage(context);
                  },
                  icon: Icon(
                    Icons.medical_services_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text(
                    'MEDICINE PAGE',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Color(0xFFE6E1C1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    navigateBloodSugar(context);
                  },
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text(
                    'BLOOD SUGAR PAGE',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Color(0xFFE6E1C1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    navigateBloodPressure(context);
                  },
                  icon: Icon(
                    Icons.bloodtype_outlined,
                    size: 50,
                    color: Colors.black,
                  ),
                  label: Text(
                    'BLOOD PRESSURE PAGE',
                    style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Color(0xFFE6E1C1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
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

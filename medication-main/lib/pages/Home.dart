// ignore: file_names
import 'package:flutter/material.dart';
import 'package:medication/pages/BloodPressure.dart';
import 'package:medication/pages/BloodSugar.dart';
import 'package:medication/pages/Medicine.dart';

import 'package:flutter/material.dart';
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
        title: const Text('User Menu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF73C8A9),
              const Color(0xFF4A91D2),
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
                    Icons.medical_services,
                    size: 50,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Medicine Page',
                    style: GoogleFonts.oxygen(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Colors.blue[900],
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
                    Icons.favorite_sharp,
                    size: 50,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Blood Sugar Page',
                    style: GoogleFonts.oxygen(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Colors.blue[900],
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
                    Icons.bloodtype_sharp,
                    size: 50,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Blood Pressure Page',
                    style: GoogleFonts.oxygen(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 150),
                    primary: Colors.blue[900],
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

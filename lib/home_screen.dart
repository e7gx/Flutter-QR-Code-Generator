import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color whiteColor = const Color(0XFFF2F2F2);
  Color blackColor = const Color(0XFF0C110F);
  Color buttonColor = const Color(0XFF00FFAE);

  String qrData = 'https://github.com/e7gx';
  TextEditingController qrDataController = TextEditingController();
  final qrKey = GlobalKey();

  @override
  void dispose() {
    qrDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          IconlyLight.category,
          color: whiteColor,
        ),
        actions: [
          Icon(
            IconlyLight.search,
            color: whiteColor,
          ),
          const SizedBox(
            width: 12,
          ),
          Icon(
            IconlyLight.scan,
            color: whiteColor,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create a personal QR-Code',
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 360,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: RepaintBoundary(
                      key: qrKey,
                      child: QrImageView(
                        data: qrData,
                        version: QrVersions.auto,
                        size: 500,
                        dataModuleStyle: QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: blackColor,
                        ),
                        eyeStyle: QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: qrDataController,
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                  cursorColor: buttonColor,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: buttonColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                        color: buttonColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (qrDataController.text.isNotEmpty) {
                      setState(() {
                        qrData = qrDataController.text;
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      )),
                  child: Text(
                    'Generate QR Code',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presence_alpha/constant/api_constant.dart';
import 'package:presence_alpha/provider/office_config_provide.dart';
import 'package:presence_alpha/screen/hr/manage_absence_screen.dart';
import 'package:presence_alpha/screen/hr/manage_karyawan_screen.dart';
import 'package:presence_alpha/screen/hr/manage_overtime_screen.dart';
import 'package:presence_alpha/screen/hr/manage_report_screen.dart';
import 'package:presence_alpha/screen/hr/ubah_pengaturan_kantor_screen.dart';
import 'package:presence_alpha/screen/profile_screen.dart';
import 'package:provider/provider.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              profileInfo(),
              profileActions(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileInfo() {
  return Stack(
    alignment: Alignment.topCenter,
    children: <Widget>[
      SizedBox(
        height: 240.0,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Consumer<OfficeConfigProvider>(
                  builder: (context, officeConfig, _) => officeLogo(
                    officeConfig.officeConfig?.logo,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Consumer<OfficeConfigProvider>(
                builder: (context, officeConfig, _) => Text(
                  officeConfig.officeConfig?.name ?? "Digital Amore Kriyanesia",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget profileActions(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text(
              'Pesetujuan Izin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageAbsenceScreen(),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text(
              'Persetujuan Lembur',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ManageOvertimeScreen()),
              );
            },
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.summarize),
            title: const Text(
              'Report Bulanan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ManageReportScreen()),
              );
            },
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.group),
            title: const Text(
              'Karyawan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageKaryawanScreen(),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Profil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Pengaturan Kantor',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UbahPengaturanKantorScreen(),
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}

Widget officeLogo(String? imagePath) {
  if (imagePath == null) {
    return Image.asset(
      'assets/images/default-logo.png',
      width: 200,
      height: 120,
    );
  }

  String profilePictureURI = "${ApiConstant.baseUrl}/$imagePath";

  return SizedBox(
    width: 200,
    height: 120,
    child: CachedNetworkImage(
      imageUrl: profilePictureURI,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          LinearProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/default.png',
        width: 200,
        height: 120,
      ),
    ),
  );
}

import 'package:presence_alpha/payload/data/today_check_data.dart';

class CommonUtility {
  static String todayStatus(TodayCheckData? obj) {
    String textToShow = '-';
    if (obj?.isAbsence == true) {
      textToShow = 'Cuti/Sakit';
    } else if (obj?.isWeekend == true) {
      textToShow = 'Akhir Pekan';
    } else if (obj?.isHoliday == true) {
      textToShow = 'Hari Libur';
    } else if (obj?.isWorkday == true) {
      textToShow = 'Hari Kerja';
    }

    return textToShow;
  }

  static String presenceStatus(TodayCheckData? obj) {
    String textToShow = '-';
    if (obj?.isHoliday == true) {
      if (obj?.haveOvertime == true) {
        if (obj?.alreadyOvertimeStarted == true) {
          textToShow = 'Lembur Belum Diakhiri';
        } else {
          textToShow = 'Lembur Belum Dimulai';
        }

        if (obj?.alreadyOvertimeEnded == true) {
          textToShow = 'Lembur Telah Berakhir';
        }
      } else {
        textToShow = 'Hari Libur';
      }
    } else if (obj?.isWeekend == true) {
      if (obj?.haveOvertime == true) {
        if (obj?.alreadyOvertimeStarted == true) {
          textToShow = 'Lembur Belum Diakhiri';
        } else {
          textToShow = 'Lembur Belum Dimulai';
        }

        if (obj?.alreadyOvertimeEnded == true) {
          textToShow = 'Lembur Telah Berakhir';
        }
      } else {
        textToShow = 'Akhir Pekan';
      }
    } else if (obj?.isAbsence == true) {
      textToShow = 'Cuti/Sakit';
    } else if (obj?.isWorkday == true) {
      if (obj?.alreadyCheckIn == false) {
        textToShow = 'Belum Check In';
      } else if (obj?.alreadyCheckOut == false) {
        textToShow = 'Belum Check Out';
      }

      if (obj?.alreadyCheckOut == true) {
        if (obj?.haveOvertime == true) {
          if (obj?.alreadyOvertimeStarted == true) {
            textToShow = 'Lembur Belum Diakhiri';
          } else {
            textToShow = 'Lembur Belum Dimulai';
          }

          if (obj?.alreadyOvertimeEnded == true) {
            textToShow = 'Lembur Telah Berakhir';
          }
        } else {
          textToShow = "Sudah Check Out";
        }
      }
    }

    return textToShow;
  }

  static String getInfoType(TodayCheckData? obj) {
    String textToShow = '0';
    if (obj?.isHoliday == true) {
      if (obj?.haveOvertime == true) {
        if (obj?.alreadyOvertimeStarted == true) {
          textToShow = '11';
        } else if (obj?.alreadyOvertimeEnded == true) {
          textToShow = '12';
        } else {
          textToShow = '10';
        }
      } else {
        textToShow = '9';
      }
    } else if (obj?.isWeekend == true) {
      if (obj?.haveOvertime == true) {
        if (obj?.alreadyOvertimeStarted == true) {
          textToShow = '11';
        } else if (obj?.alreadyOvertimeEnded == true) {
          textToShow = '12';
        } else {
          textToShow = '10';
        }
      } else {
        textToShow = '8';
      }
    } else if (obj?.isAbsence == true) {
      textToShow = '7';
    } else if (obj?.isWorkday == true) {
      if (obj?.alreadyCheckIn == false) {
        textToShow = '1';
      } else if (obj?.alreadyCheckOut == false) {
        textToShow = '2';
      }

      if (obj?.alreadyCheckOut == true) {
        if (obj?.haveOvertime == true) {
          if (obj?.alreadyOvertimeStarted == true) {
            textToShow = '5';
          } else if (obj?.alreadyOvertimeEnded == true) {
            textToShow = '6';
          } else {
            textToShow = '4';
          }
        } else {
          textToShow = '3';
        }
      }
    }

    return textToShow;
  }

  static String kurangiWaktu(String waktu, int pengurang) {
    // Parsing waktu awal
    List<String> parts = waktu.split(":");
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    // Mengurangkan menit
    minutes -= pengurang;

    // Memastikan bahwa waktu yang dikurangkan tidak menjadi negatif
    while (minutes < 0) {
      hours -= 1;
      minutes += 60;
    }

    // Mengatasi jika jam melebihi 24
    while (hours < 0) {
      hours += 24;
    }

    // Mengonversi kembali ke format "HH:mm"
    String newTime = "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";

    print("new time $newTime");
    return newTime;
  }

}

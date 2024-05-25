import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sortcoff/global/widgets/navbar.dart';
import 'package:sortcoff/views/home/views/services_button.dart';
import 'package:weather/weather.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherFactory weatherFactory =
      WeatherFactory("87ceae4944e87632bcc672b5130b4248");

  Weather? weatherData;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    try {
      Weather weather = await weatherFactory.currentWeatherByCityName("London");
      setState(() {
        weatherData = weather;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  IconData getWeatherIcon(String weatherIconCode) {
    switch (weatherIconCode) {
      case '01d':
        return UniconsLine.sun;
      case '01n':
        return UniconsLine.moon;
      case '02d':
        return UniconsLine.cloud_sun;
      case '02n':
        return UniconsLine.cloud_moon;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        return UniconsLine.cloud;
      case '09d':
      case '09n':
        return UniconsLine.cloud_rain;
      case '10d':
        return UniconsLine.cloud_sun_rain;
      case '10n':
        return UniconsLine.cloud_moon_rain;
      case '11d':
      case '11n':
        return UniconsLine.thunderstorm;
      case '13d':
      case '13n':
        return UniconsLine.snow_flake;
      case '50d':
      case '50n':
        return UniconsLine.windy;
      default:
        return UniconsLine.question_circle;
    }
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda ingin keluar dari aplikasi?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Ya'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Image.asset(
                          'assets/images/background/bg1.png',
                          width: 430,
                          height: 341.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 33.0,
                              ),
                              const Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, left: 8),
                                        child: Text(
                                          'Selamat Datang',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 20,
                                              backgroundImage: AssetImage(
                                                  'assets/profile_image.png'),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 4),
                                            child: Text(
                                              'Pak Udin',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      94, 68, 55, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 395,
                                height: 147,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color.fromRGBO(237, 165, 67, 1),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 367,
                                      height: 24,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              245, 218, 183, 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        'Hasil Panen',
                                        style: TextStyle(
                                          color: Color.fromRGBO(92, 68, 56, 1),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 155,
                                          height: 65,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Panen ke 3',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      101, 90, 85, 1),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '2333 kg',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      101, 90, 85, 1),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Expanded(
                                          child: Text(
                                            'ini deskripsi panjang blawlwlkwlkdlawdwamdoawmdowamdowadawkdlakwkda',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(94, 68, 55, 1),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(101, 90, 85, 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              getWeatherIcon(
                                                  weatherData?.weatherIcon ??
                                                      ''),
                                              color: Colors.white,
                                              size: 60,
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  weatherData?.areaName ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${DateTime.now().hour}:${DateTime.now().minute}',
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  '${weatherData?.temperature?.celsius ?? ''} °C',
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  weatherData
                                                          ?.weatherDescription ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Layanan',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ServiceButtons(
                                    onTeleponPressed: () {
                                      Navigator.pushNamed(context, '/telepon');
                                    },
                                    onPesanPressed: () {
                                      Navigator.pushNamed(context, '/pesan');
                                    },
                                    onEmailPressed: () {
                                      Navigator.pushNamed(context, '/email');
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Tentang Kopi',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 395,
                                          height: 248,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/content/tentang.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Center(
                                        child: Text(
                                          'Aplikasi SortCoff merupakan aplikasi yang dirancang khusus untuk para petani kopi agar dapat memudahkan dalam pencatatan hasil panen, pencatatan keuangan berkaitan dengan panen, dan fitur utamanya dari SortCoff memilah biji kopi berdasarkan warna dan ukuran secara otomatis menggunakan mesin SortCoff.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

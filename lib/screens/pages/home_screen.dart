import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sajda/app/globals.dart';
import 'package:sajda/bloc_state_manegment/namoz_vaqtlari/namoz_vaqtlari_bloc.dart';
import 'package:sajda/bloc_state_manegment/theme_bloc/theme_mode_bloc.dart';
import 'package:sajda/screens/pages/about.dart';
import 'package:sajda/screens/pages/murojat.dart';
import 'package:sajda/screens/tabs/duolar.dart';
import 'package:sajda/screens/tabs/hadislar.dart';
import 'package:sajda/screens/tabs/suralar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String locationCity = 'Toshkent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF040C23),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/islambac.png",
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 137,
                  ),
                  BlocConsumer<ThemeModeBloc, ThemeModeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return state is SetDarkThemeModeState
                          ? IconButton(
                              onPressed: () {
                                BlocProvider.of<ThemeModeBloc>(context).add(
                                  SetLightThemeEvent(),
                                );
                              },
                              icon: Image.asset(
                                'assets/images/moon.png',
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black.withOpacity(0.8)
                                    : text,
                                height: 25,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                BlocProvider.of<ThemeModeBloc>(context).add(
                                  SetDarkThemeEvent(),
                                );
                              },
                              icon: Image.asset(
                                "assets/images/sun.png",
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black.withOpacity(0.8)
                                    : text,
                                height: 25,
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.black87
                          : const Color.fromARGB(255, 12, 32, 92),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutPage();
                      },
                    ),
                  );
                },
                child: const Text('Ilova haqida')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : const Color.fromARGB(255, 12, 32, 92),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const CommentsPage();
                      },
                    ),
                  );
                },
                child: const Text('Murojat uchun')),
            Row(
              children: [
                Text(
                  'Versiya: 1.0.0',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
           const Spacer(),
            Image.asset(
              "assets/images/liner.png",
              color: const Color.fromARGB(255, 64, 114, 251),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: const Color(0xFF040C23).withOpacity(0.6),
            height: 1.0,
          ),
        ),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: SvgPicture.asset(
            'assets/svgs/menu-icon.svg',
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black.withOpacity(0.8)
                : text,
          ),
        ),
        title: Row(children: [
          const SizedBox(
            width: 24,
          ),
          Text(
            'Muhammad (s.a.v.)',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.8)
                    : Colors.white),
          ),
          const Spacer(),
          BlocConsumer<ThemeModeBloc, ThemeModeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is SetDarkThemeModeState
                  ? IconButton(
                      onPressed: () {
                        BlocProvider.of<ThemeModeBloc>(context).add(
                          SetLightThemeEvent(),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/moon.png',
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black.withOpacity(0.8)
                            : text,
                        height: 25,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        BlocProvider.of<ThemeModeBloc>(context).add(
                          SetDarkThemeEvent(),
                        );
                      },
                      icon: Image.asset(
                        "assets/images/sun.png",
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black.withOpacity(0.8)
                            : text,
                        height: 25,
                      ),
                    );
            },
          ),
        ]),
      ),
      // appBar: _appBar(),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<NamozVaqtlariBloc, NamozVaqtlariState>(
                      builder: (context, state) {
                        return state is SuccesNamozVaqtlariState
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Namoz vaqtlari: ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                       const Icon(Icons.location_on),
                                        TextButton(
                                          onPressed: () {
                                            showAlertDialog(context);
                                          },
                                          child: Text(
                                            locationCity,
                                            style: GoogleFonts.poppins(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  times(
                                      "Bomdod",
                                      "bomdod",
                                      state.time.times!.tongSaharlik!
                                          .toString()),
                                  times("Quyosh", "sun2",
                                      state.time.times!.quyosh!.toString()),
                                  times("Peshin", "sun2",
                                      state.time.times!.peshin!.toString()),
                                  times("Asr", "asr",
                                      state.time.times!.asr!.toString()),
                                  times("Shom", "shom",
                                      state.time.times!.shomIftor!.toString()),
                                  times("Hufton", "hufton",
                                      state.time.times!.hufton!.toString()),
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Namoz vaqtlari: ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Icon(Icons.location_on),
                                        TextButton(
                                          onPressed: () {
                                            showAlertDialog(context);
                                          },
                                          child: Text(
                                            "Loading ...",
                                            style: GoogleFonts.poppins(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            times("Bomdod", "bomdod", ""),
                                            times("Quyosh", "sun2", ""),
                                            times("Peshin", "sun2", ""),
                                            times("Asr", "asr", ""),
                                            times("Shom", "shom", ""),
                                            times("Hufton", "hufton", ""),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          BlocProvider.of<NamozVaqtlariBloc>(
                                                  context)
                                              .add(GetNamozVaqtiEvent(
                                                  'Toshkent'));
                                        },
                                        icon: Image.asset(
                                          'assets/images/reload.png',
                                          scale: 22,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              );
                      },
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                shape: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: const Color(0xFFAAAAAA).withOpacity(.1))),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tab(),
                ),
              )
            ],
            body: const TabBarView(
              children: [
                SurahTab(),
                DuolarScreen(),
                HadislarScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: text,
        labelColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        indicatorColor: primary,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Sura"),
          _tabItem(label: "Duolar"),
          _tabItem(label: "Hadislar"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  times(
    String txt,
    String img,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 28,
            width: 3,
            color: primary,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 30,
            child: Image.asset(
              'assets/images/$img.png',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$txt: $time',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }



  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? const Color.fromARGB(255, 180, 194, 236)
              : const Color.fromARGB(255, 13, 30, 83),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          content: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 10,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFF040C23)
                                  : Colors.white,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Zikr va Duolar",
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  viloyat("Toshkent", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Toshkent"));
                    locationCity = 'Toshkent';
                    Navigator.pop(context);
                  }),
                  viloyat("Andijon", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Andijon"));
                    locationCity = 'Andijon';
                    Navigator.pop(context);
                  }),
                  viloyat("Farg'ona", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Farg'ona"));
                    locationCity = 'Farg`ona';
                    Navigator.pop(context);
                  }),
                  viloyat("Namangan", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Namangan"));
                    locationCity = 'Namangan';
                    Navigator.pop(context);
                  }),
                  viloyat("Guliston", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Guliston"));
                    locationCity = 'Guliston';
                    Navigator.pop(context);
                  }),
                  viloyat("Jizzax", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Jizzax"));
                    locationCity = 'Jizzax';
                    Navigator.pop(context);
                  }),
                  viloyat("Samarqand", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Samarqand"));
                    locationCity = 'Samarqand';
                    Navigator.pop(context);
                  }),
                  viloyat("Qarshi", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Qarshi"));
                    locationCity = 'Qarshi';
                    Navigator.pop(context);
                  }),
                  viloyat("Navoiy", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Navoiy"));
                    locationCity = 'Navoiy';
                    Navigator.pop(context);
                  }),
                  viloyat("Buxoro", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Buxoro"));
                    locationCity = 'Buxoro';
                    Navigator.pop(context);
                  }),
                  viloyat("Xiva", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Xiva"));
                    locationCity = 'Xiva';
                    Navigator.pop(context);
                  }),
                  viloyat("O'smat", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("O'smat"));
                    locationCity = 'O`smat';

                    Navigator.pop(context);
                  }),
                  viloyat("Nukus", () {
                    BlocProvider.of<NamozVaqtlariBloc>(context)
                        .add(GetNamozVaqtiEvent("Nukus"));
                    locationCity = 'Nukus';

                    Navigator.pop(context);
                  }),
                ],
              ),
            ),
          ),
          actions: const [],
        );
      },
    );
  }

  viloyat(String nomi, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF040C23),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            nomi,
            style: GoogleFonts.poppins(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}

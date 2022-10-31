import 'package:dream11/match_model.dart';
import 'package:dream11/match_screen.dart';
import 'package:dream11/match_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:jiffy/jiffy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.red, statusBarIconBrightness: Brightness.light));
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          title: 'Dream11',
          theme: ThemeData(
            // Define the default brightness and colors.
            // brightness: Brightness.dark,
            // primaryColor: Colors.red.shade700,
            primarySwatch: Colors.red,

            // Define the default `TextTheme`. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: GoogleFonts.ubuntuTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentTab = 1;
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Title",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
            bottom: PreferredSize(
              child: TabBar(
                controller: controller,
                tabs: [
                  Tab(
                    // text: "Upcoming",
                    icon: Text(
                      "Upcoming",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      "Live",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      "Results",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
                isScrollable: true,
              ),
              preferredSize: const Size.fromHeight(50.0),
            ),
          ),

          // slider
          SliverPadding(
            padding: const EdgeInsets.only(top: 8),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 18.h,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),

          SliverFillRemaining(
            fillOverscroll: true,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: TabBarView(
                controller: controller,
                children: [
                  _getUpcomingView(),
                  _getLiveView(),
                  _getResultsView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUpcomingView() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var i = 0; i < upcomings.length; i++)
            MatchTileWidget(
              match: upcomings[i],
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => MatchScreen(match: upcomings[i])));
              },
            ),
        ],
      ),
    );
  }

  Widget _getLiveView() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var i = 0; i < live.length; i++)
            MatchTileWidget(
              match: live[i],
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => MatchScreen(match: live[i])));
              },
            ),
        ],
      ),
    );
  }

  Widget _getResultsView() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var i = 0; i < results.length; i++)
            MatchTileWidget(
              match: results[i],
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => MatchScreen(match: results[i])));
              },
            ),
        ],
      ),
    );
  }
}

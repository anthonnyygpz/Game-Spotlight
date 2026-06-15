import 'package:flutter/material.dart';
import 'package:dpad/dpad.dart';
import 'package:game_tv/features/home/views/widgets/game_trailer_card.dart';
import 'package:game_tv/features/home/views/widgets/navbar.dart';
import 'package:game_tv/features/home/views/widgets/sidebar.dart';
import 'package:game_tv/features/home/views/widgets/special_trailer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050812),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Navbar(),
            const SizedBox(height: 10),

            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    left: 75.0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: DpadRegion(
                                enter: DpadEnterBehavior.entry,
                                child: Row(
                                  children: List.generate(
                                    4,
                                    (index) => Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.85,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: FocusTraversalOrder(
                                        order: NumericFocusOrder(
                                          index.toDouble(),
                                        ),
                                        child: SpecialTrailerCard(isEntry: index == 0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          Text(
                            'TRAILERS ESPECIALES',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.28,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: DpadRegion(
                                child: Row(
                                  children: List.generate(
                                    5,
                                    (index) => Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.28,
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: FocusTraversalOrder(
                                        order: NumericFocusOrder(
                                          index.toDouble(),
                                        ),
                                        child: GameTrailerCard(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            'PROXIMOS LANZAMIENTOS',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: DpadRegion(
                                child: Row(
                                  children: List.generate(
                                    5,
                                    (index) => Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.28,
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                      ),
                                      child: FocusTraversalOrder(
                                        order: NumericFocusOrder(
                                          index.toDouble(),
                                        ),
                                        child: GameTrailerCard(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: DpadRegion(child: Sidebar()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

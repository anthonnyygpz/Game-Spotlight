import 'package:flutter/material.dart';
import 'package:game_tv/features/auth/views/widgets/card_glass.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialTrailerCard extends StatelessWidget {
  final bool isEntry;

  const SpecialTrailerCard({super.key, this.isEntry = false});

  @override
  Widget build(BuildContext context) {
    return CardGlass(
      isEntry: isEntry,
      onPressed: () {},
      enableBlur: false,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/eclipse.png', fit: BoxFit.fill),
          ),
          Positioned(
            top: 0,
            left: 30,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  'NUEVO LANZAMIENTO',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.deepPurple.shade200,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'ECPLIPSE',
                      style: GoogleFonts.cinzel(
                        textStyle: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          height: 2.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white.withValues(alpha: 0),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'REBIRTH',
                          style: GoogleFonts.cinzel(
                            textStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Container(
                          height: 2.0, // Grosor de la línea
                          width: 40.0, // Largo de la línea
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white,
                                Colors.white.withValues(alpha: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Text(
                  'UN MUNDO CAE. UN HEROE SE LEVANTA',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),

                const CardGlass(
                  borderColor: Colors.deepPurple,
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'VER TRAILER ESPECIAL',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        softWrap: true,
                      ),

                      Icon(Icons.play_arrow, color: Colors.white, size: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 35,
            right: 30,
            child: CardGlass(
              padding: const EdgeInsets.all(5.0),
              color: Colors.deepPurple.withValues(alpha: 0.1),
              borderColor: Colors.deepPurple,
              child: Column(
                children: [
                  const Text(
                    'LANZAMIENTOS',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),

                  const Text(
                    '24',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),

                  const Text(
                    'MAYO 2027',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Dots
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  width: 6,
                  height: 6,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 6,
                  height: 6,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 6,
                  height: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:game_tv/features/auth/views/widgets/card_glass.dart';
import 'package:google_fonts/google_fonts.dart';

class GameTrailerCard extends StatelessWidget {
  final bool isEntry;

  const GameTrailerCard({super.key, this.isEntry = false});

  @override
  Widget build(BuildContext context) {
    return CardGlass(
      isEntry: isEntry,
      onPressed: () {},
      enableBlur: false,
      bgImage: AssetImage('assets/img.png'),
      padding: const EdgeInsets.all(10),
      borderSize: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 25,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Badge(
                label: Text(
                  'NUEVO',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                smallSize: 2,
                largeSize: 3,
                backgroundColor: Colors.deepPurple,
              ),
              const SizedBox(height: 30),
              Text(
                'ECPLIPSE',
                style: GoogleFonts.cinzel(
                  textStyle: TextStyle(
                    fontSize: 18,
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
                    width: 15.0,
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
                      textStyle: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),

                  Container(
                    height: 2.0, // Grosor de la línea
                    width: 15.0, // Largo de la línea
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

              const SizedBox(height: 10),
              const Text(
                'TRAILER DE LANZAMIENTO',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade500.withValues(alpha: 0.2),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: const Icon(Icons.play_arrow, size: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

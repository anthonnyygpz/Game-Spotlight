import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drop_cap_text/flutter_drop_cap_text.dart';
import 'package:game_tv/core/widgets/tv_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material3_expressive_loading_indicator/material3_expressive_loading_indicator.dart';
import 'package:video_player/video_player.dart';

class GameDetailsScreen extends StatefulWidget {
  final String? id;

  const GameDetailsScreen({super.key, required this.id});

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  late VideoPlayerController _controller;
  late Duration currentPosition = _controller.value.position;
  late Duration durationTotal = _controller.value.duration;

  // FIX: cambiar por db
  late bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://hnzgjlwxfvrdqfpoxivm.supabase.co/storage/v1/object/public/video/357054.mp4',
            ),
          )
          ..initialize().then((_) {
            setState(() {});
          });

    _controller.addListener(() {
      setState(() {
        // currentPosition = _controller.value.position;
      });
    });
  }

  String formatoTiempo(Duration duracion) {
    String dosDigitos(int n) => n.toString().padLeft(2, '0');
    final horas = dosDigitos(duracion.inHours);
    final minutos = dosDigitos(duracion.inMinutes.remainder(60));
    final segundos = dosDigitos(duracion.inSeconds.remainder(60));

    return [if (duracion.inHours > 0) horas, minutos, segundos].join(':');
  }

  void _enterFullScreen() {
    Navigator.of(context)
        .push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, _, __) => Scaffold(
              backgroundColor: Colors.black,
              body: Focus(
                autofocus: true,
                onKeyEvent: (node, event) {
                  if (event is KeyDownEvent &&
                      (event.logicalKey == LogicalKeyboardKey.select ||
                          event.logicalKey == LogicalKeyboardKey.enter ||
                          event.logicalKey == LogicalKeyboardKey.gameButtonA)) {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              ),
            ),
            transitionsBuilder: (context, animation, _, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        )
        .then((_) {
          // Sincronizar el estado de la UI base al cerrar la pantalla completa
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const .only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const .symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      icon: Icon(Icons.chevron_left),
                      iconSize: 14,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const Text('Trailer especial'),

                  const SizedBox(width: 25),
                  // Text(''),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 0.5,
                          ),
                          right: BorderSide(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const .symmetric(horizontal: 25),
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),

                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Trailer especial',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: colorScheme.onSecondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.3,
                                    ),
                                    thickness: 0.5,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Azonix',
                              ),
                            ),

                            Divider(
                              color: colorScheme.primary.withValues(alpha: 0.3),
                              thickness: 0.5,
                            ),

                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisSize: .min,
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 10,
                                      ),
                                      Text(
                                        '9.1',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                      color: colorScheme.primary.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '1H 42M',
                                    style: GoogleFonts.montserrat(fontSize: 10),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                      color: colorScheme.primary.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '2026',
                                    style: GoogleFonts.montserrat(fontSize: 10),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                      color: colorScheme.primary.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '4K - ESPAÑOL',
                                    style: GoogleFonts.montserrat(fontSize: 10),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 3,
                                    ),
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                      color: colorScheme.primary.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),

                                  Text(
                                    '12 CIUDADES',
                                    style: GoogleFonts.montserrat(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            DropCapText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                height: 1.5,
                                color: colorScheme.onPrimary.withValues(
                                  alpha: 0.6,
                                ),
                                fontWeight: FontWeight.w400,
                              ),
                              dropCapStyle: TextStyle(
                                fontSize: 30,
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              dropCapPadding: EdgeInsets.only(right: 5.0),
                            ),
                            const SizedBox(height: 20),

                            Text(
                              '${formatoTiempo(_controller.value.position)} / ${formatoTiempo(_controller.value.duration)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            ExpressiveLinearProgressIndicator(
                              minHeight: 14,
                              amplitude: _controller.value.isPlaying
                                  ? 0.45
                                  : 0.0,
                              wavelength: 30,
                              waveSpeed: 40,
                              value:
                                  _controller.value.position.inMilliseconds /
                                  _controller.value.duration.inMilliseconds,
                            ),

                            Row(
                              spacing: 10,
                              children: [
                                TvButton(
                                  label: _controller.value.isPlaying
                                      ? 'PAUSAR'
                                      : 'REPRODUCIR',
                                  icon: _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                ),

                                TvButton(
                                  label: 'Favoritos',
                                  icon: isFavorite
                                      ? Icons.favorite_outline
                                      : Icons.favorite,
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                ),

                                TvButton(
                                  label: 'Pantalla completa',
                                  icon: Icons.fullscreen,
                                  onPressed: _enterFullScreen,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 0.5,
                          ),
                          bottom: BorderSide(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const .all(10.0),
                        child: Column(
                          children: [
                            _controller.value.isInitialized
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: colorScheme.primary.withValues(
                                          alpha: 0.6,
                                        ),
                                        width: 1,
                                      ),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    ),
                                  )
                                : SizedBox(
                                    height: 260,
                                    child: Center(
                                      child: ExpressiveLoadingIndicator(
                                        style: .outlined,
                                      ),
                                    ),
                                  ),

                            Padding(
                              padding: const .symmetric(vertical: 5),
                              child: Divider(
                                thickness: 1,
                                color: colorScheme.primary.withValues(
                                  alpha: 0.3,
                                ),
                              ),
                            ),

                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                height: 1.5,
                                color: colorScheme.onPrimary.withValues(
                                  alpha: 0.8,
                                ),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

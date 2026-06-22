import 'package:flutter/material.dart';
import 'package:game_tv/core/widgets/game_card.dart';
import 'package:game_tv/features/home/models/game_item.dart';

class ContentRow extends StatelessWidget {
  final String title;
  final List<GameItem> items;
  final double cardWidth;
  final double cardHeight;
  final bool showPlayButton;
  final bool showDate;
  final bool showBadgeTop;
  final String? trailingLabel;
  final int focusedCol;
  final ScrollController scrollController;

  const ContentRow({
    super.key,
    required this.title,
    required this.items,
    required this.cardWidth,
    required this.cardHeight,
    required this.focusedCol,
    required this.scrollController,
    this.showPlayButton = false,
    this.showDate = false,
    this.showBadgeTop = false,
    this.trailingLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasTrailingAction = trailingLabel != null;
    final totalItems = hasTrailingAction ? items.length + 1 : items.length;

    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 18,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                // Indicador de telemetría visual (No enfocable, puramente informativo)
                if (hasTrailingAction)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'DESLIZA AL FINAL',
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: 0.35),
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: colorScheme.onSurface.withValues(alpha: 0.35),
                        size: 14,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: cardHeight,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: totalItems,
              itemExtent: cardWidth + 12,
              itemBuilder: (context, index) {
                // Tarjeta de Acción "Ver más" al final del scroll
                if (hasTrailingAction && index == items.length) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: focusedCol == index
                            ? colorScheme.primary.withValues(alpha: 0.15)
                            : colorScheme.surface.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: focusedCol == index
                              ? colorScheme.primary
                              : Colors.transparent,
                          width: 2.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              size: 28,
                              color: focusedCol == index
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              trailingLabel!.toUpperCase(),
                              style: TextStyle(
                                color: focusedCol == index
                                    ? colorScheme.primary
                                    : colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                // Tarjetas estándar
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: RepaintBoundary(
                    child: GameCard(
                      item: items[index],
                      width: cardWidth,
                      height: cardHeight,
                      isFocused: focusedCol == index,
                      showPlayButton: showPlayButton,
                      showDate: showDate,
                      showBadgeTop: showBadgeTop,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

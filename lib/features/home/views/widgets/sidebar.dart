import 'package:flutter/material.dart';
import 'package:dpad/dpad.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  bool _isExpanded = false; // Control de estado interno gestionado por el foco

  final List<Map<String, dynamic>> sidebar = [
    {'title': 'INICIO', 'icon': Icons.home, 'route': 'home'},
    {
      'title': 'PROXIMOS LANZAMIENTOS',
      'icon': Icons.rocket,
      'route': 'upcoming_releases',
    },
    {
      'title': 'TRAILERS EXCLUSIVOS',
      'icon': Icons.movie_outlined,
      'route': 'exclusive_trailers',
    },
    {'title': 'GENEROS', 'icon': Icons.sports_esports, 'route': 'genres'},
    {'title': 'PLATAFORMAS', 'icon': Icons.tv, 'route': 'platforms'},
    {
      'title': 'FAVORITOS',
      'icon': Icons.favorite_outlined,
      'route': 'favorites',
    },
    {'title': 'AJUSTES', 'icon': Icons.settings, 'route': 'settings'},
  ];

  @override
  Widget build(BuildContext context) {
    // El widget Focus escucha si cualquier elemento hijo recibe el foco del D-pad
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (hasFocus) {
        setState(() {
          _isExpanded = hasFocus;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: _isExpanded ? 200 : 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xFF050812),
              const Color(0xFF050812).withValues(alpha: 0.8),
              const Color(0xFF050812).withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.7, 1.0],
          ),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sidebar.length,
          itemBuilder: (context, index) {
            final bool isSelected = _selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: DpadFocusable(
                onSelect: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: const SizedBox.shrink(),
                builder: (context, state, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      horizontal: _isExpanded ? 10.0 : 0.0,
                      vertical: 15.0,
                    ),
                    alignment: _isExpanded ? Alignment.centerLeft : Alignment.center,
                    decoration: BoxDecoration(
                      color: state.focused 
                          ? Colors.deepPurple 
                          : (isSelected ? Colors.deepPurple.withValues(alpha: 0.3) : Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: _isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        Icon(
                          sidebar[index]['icon'],
                          color: (isSelected || state.focused) ? Colors.white : Colors.grey,
                          size: 24,
                        ),
                        if (_isExpanded) ...[
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              sidebar[index]['title'],
                              style: TextStyle(
                                fontSize: 14,
                                color: (isSelected || state.focused) ? Colors.white : Colors.grey,
                                fontWeight: (isSelected || state.focused) ? FontWeight.bold : FontWeight.normal,
                              ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

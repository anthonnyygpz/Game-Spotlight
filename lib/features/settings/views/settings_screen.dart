import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_tv/core/providers/auth/auth_provider.dart';
import 'package:game_tv/core/widgets/base_scaffold.dart';
import 'package:game_tv/features/settings/models/setting_tab.dart';

const _tabs = [
  SettingsTab(label: 'PERFIL Y CUENTA', icon: Icons.person_outline),
  SettingsTab(label: 'PANTALLA Y AUDIO', icon: Icons.tv_outlined),
  SettingsTab(label: 'NOTIFICACIONES', icon: Icons.notifications_outlined),
  SettingsTab(label: 'PRIVACIDAD Y SEGURIDAD', icon: Icons.shield_outlined),
  SettingsTab(label: 'ACERCA DE', icon: Icons.info_outline),
];

const _bgCard = Color(0xFF1C1A35);
const _purple = Color(0xFF7B5CF5);
const _purpleDim = Color(0xFF3D2F7A);
const _red = Color(0xFF8B1A2A);
const _textPrimary = Colors.white;
const _textSecondary = Color(0xFFB0ADCC);
const _divider = Color(0xFF2A2845);

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  FocusZone _zone = FocusZone.sidebar;
  int _selectedTab = 0;
  int _focusedTab = 0;
  int _focusedAction = 0;

  static const _kActionCount = 4;

  KeyEventResult _handleKey(KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    // ── Zona: Sidebar ─────────────────────────────────────────────────────
    if (_zone == FocusZone.sidebar) {
      if (key == LogicalKeyboardKey.arrowRight) {
        setState(() {
          _zone = FocusZone.tabs;
          _focusedTab = _selectedTab;
        });
        // Ignoramos: BaseScaffold recibe la tecla y aplica un delta de +1
        return KeyEventResult.ignored;
      }
      return KeyEventResult.ignored;
    }

    // ── Zona: Tabs ────────────────────────────────────────────────────────
    if (_zone == FocusZone.tabs) {
      if (key == LogicalKeyboardKey.arrowUp) {
        setState(
          () => _focusedTab = (_focusedTab - 1).clamp(0, _tabs.length - 1),
        );
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowDown) {
        setState(
          () => _focusedTab = (_focusedTab + 1).clamp(0, _tabs.length - 1),
        );
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowLeft) {
        setState(() => _zone = FocusZone.sidebar);
        // Ignoramos: BaseScaffold recibe la tecla y aplica un delta de -1
        return KeyEventResult.ignored;
      }
      if (key == LogicalKeyboardKey.arrowRight) {
        setState(() {
          _zone = FocusZone.actions;
          _focusedAction = 0;
        });
        // Consumimos: No queremos que el global avance, Actions es navegación interna
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) {
        setState(() => _selectedTab = _focusedTab);
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    // ── Zona: Actions ─────────────────────────────────────────────────────
    if (_zone == FocusZone.actions) {
      if (key == LogicalKeyboardKey.arrowUp) {
        setState(
          () =>
              _focusedAction = (_focusedAction - 1).clamp(0, _kActionCount - 1),
        );
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowDown) {
        setState(
          () =>
              _focusedAction = (_focusedAction + 1).clamp(0, _kActionCount - 1),
        );
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.arrowLeft) {
        setState(() {
          _zone = FocusZone.tabs;
          _focusedTab = _selectedTab;
        });
        // Consumimos: Retornamos a los Tabs internos, el global sigue en col = 0
        return KeyEventResult.handled;
      }
      if (key == LogicalKeyboardKey.select || key == LogicalKeyboardKey.enter) {
        _handleActionSelect(_focusedAction);
        return KeyEventResult.handled;
      }
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _handleActionSelect(int action) {
    switch (action) {
      case 0:
        break; // Editar perfil
      case 1:
        break; // Ver dispositivos
      case 2:
        break; // Cambiar contraseña
      case 3:
        _logout();
    }
  }

  void _logout() => ref.read(logoutProvider)();

  // ─── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      rowItemCounts: const [1],
      keyHandler: _handleKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TabColumn(
              tabs: _tabs,
              selectedTab: _selectedTab,
              focusedTab: _focusedTab,
              isActive: _zone == FocusZone.tabs,
            ),
            const SizedBox(width: 24),
            Expanded(child: _buildPanel()),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() => switch (_selectedTab) {
    0 => _AccountPanel(
      focusedAction: _zone == FocusZone.actions ? _focusedAction : -1,
      onLogout: _logout,
    ),
    _ => _PlaceholderPanel(label: _tabs[_selectedTab].label),
  };
}

// ─── Tab column ───────────────────────────────────────────────────────────────

class _TabColumn extends StatelessWidget {
  const _TabColumn({
    required this.tabs,
    required this.selectedTab,
    required this.focusedTab,
    required this.isActive,
  });

  final List<SettingsTab> tabs;
  final int selectedTab;
  final int focusedTab;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: tabs
            .asMap()
            .entries
            .map(
              (e) => _TabItem(
                label: e.value.label,
                icon: e.value.icon,
                isSelected: selectedTab == e.key,
                isFocused: isActive && focusedTab == e.key,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.isFocused,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    final bg = isFocused
        ? _purple
        : isSelected
        ? _purpleDim
        : Colors.transparent;
    final textColor = (isFocused || isSelected) ? _textPrimary : _textSecondary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: isFocused
            ? Border.all(color: _purple.withValues(alpha: 0.8), width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 11,
                fontWeight: (isSelected || isFocused)
                    ? FontWeight.w700
                    : FontWeight.w400,
                letterSpacing: 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Account panel ────────────────────────────────────────────────────────────

class _AccountPanel extends StatelessWidget {
  const _AccountPanel({required this.focusedAction, required this.onLogout});

  final int focusedAction;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'AJUSTES DE CUENTA',
            style: TextStyle(
              color: _textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _Avatar(),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Usuario_Game_Spotlight',
                  style: TextStyle(
                    color: _textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              _ActionButton(
                label: 'EDITAR PERFIL',
                isFocused: focusedAction == 0,
                color: _purple,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: _divider, height: 1),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _LabelRow(label: 'Idioma de la interfaz'),
                    SizedBox(height: 18),
                    _LabelRow(label: 'Control Parental'),
                    SizedBox(height: 18),
                    _LabelRow(label: 'Gestión de Suscripción'),
                    SizedBox(height: 18),
                    _LabelRow(label: 'Dispositivos Vinculados'),
                    SizedBox(height: 18),
                    _LabelRow(label: 'Seguridad de la Cuenta'),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Control Parental',
                      style: TextStyle(
                        color: _textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Desactivado — restringe el acceso a juegos con clasificación parental.',
                      style: TextStyle(color: _textSecondary, fontSize: 11),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dispositivos Vinculados',
                      style: TextStyle(
                        color: _textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _ActionButton(
                      label: 'Ver Todos',
                      isFocused: focusedAction == 1,
                      color: _purpleDim,
                    ),
                    const SizedBox(height: 8),
                    _ActionButton(
                      label: 'Cambiar Contraseña',
                      isFocused: focusedAction == 2,
                      color: _purpleDim,
                    ),
                    const SizedBox(height: 8),
                    _ActionButton(
                      label: 'Cerrar Sesión',
                      isFocused: focusedAction == 3,
                      color: _red,
                      onTap: onLogout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Auxiliares ───────────────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _purple, width: 2),
        color: _purpleDim,
      ),
      child: const Icon(Icons.person, color: _textPrimary, size: 26),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.isFocused,
    required this.color,
    this.onTap,
  });

  final String label;
  final bool isFocused;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isFocused ? Colors.white : Colors.transparent,
          width: 2,
        ),
        boxShadow: isFocused
            ? [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 10)]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: _textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LabelRow extends StatelessWidget {
  const _LabelRow({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: _textPrimary, fontSize: 13),
    );
  }
}

class _PlaceholderPanel extends StatelessWidget {
  const _PlaceholderPanel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Próximamente...',
            style: TextStyle(color: _textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

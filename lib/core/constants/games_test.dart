import 'package:game_tv/core/domain/games/entities/game_entity.dart';

final List<GameEntity> mockGames = [
  // ─────────────────────────────────────────────
  // idJuego: '1' — Grand Theft Auto VI
  // Rockstar Games | Nov 19, 2026
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '1',
    titulo: 'Grand Theft Auto VI',
    slug: 'grand-theft-auto-vi',
    sinopsis:
        'Jason y Lucía siempre supieron que el destino estaba en su contra. Cuando un golpe fácil sale mal, se encuentran en el lado más oscuro del lugar más soleado de América, atrapados en una conspiración criminal que se extiende por todo el estado de Leonida.',
    fechaLanzamiento: '2026-11-19',
    desarrollador: 'Rockstar Games',
    editor: 'Rockstar Games',
    imagenPortada: 'https://img.youtube.com/vi/s3pDMUWlA6I/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/VQRLujxTm3c/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2025-05-06T09:30:00Z',
    updatedAt: '2026-06-25T12:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '2' — Marvel's Wolverine
  // Insomniac Games | Sep 15, 2026
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '2',
    titulo: "Marvel's Wolverine",
    slug: 'marvels-wolverine',
    sinopsis:
        'Logan pensaba que había terminado de ser Wolverine, pero el pasado no había terminado con él. Tres años después de abandonar a su equipo, Wolverine se reúne con el Equipo X en su hora más oscura para enfrentarse a Bolívar Trask, un industrialista fanático que secuestra mutantes.',
    fechaLanzamiento: '2026-09-15',
    desarrollador: 'Insomniac Games',
    editor: 'Sony Interactive Entertainment',
    imagenPortada: 'https://img.youtube.com/vi/s3pDMUWlA6I/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/OiBo_NgYI5Q/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2025-09-24T17:00:00Z',
    updatedAt: '2026-06-02T17:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '3' — Resident Evil Requiem
  // Capcom | Feb 28, 2026
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '3',
    titulo: 'Resident Evil Requiem',
    slug: 'resident-evil-requiem',
    sinopsis:
        'Grace Ashcroft, joven analista del FBI, es arrojada al mundo del horror biológico. Una nueva era del survival horror comienza con un misterio que la llevará a los límites de su resistencia en la entrada más aterradora de la saga.',
    fechaLanzamiento: '2026-02-28',
    desarrollador: 'Capcom',
    editor: 'Capcom',
    imagenPortada: 'https://img.youtube.com/vi/paigphanR9o/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/paigphanR9o/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2025-06-06T20:00:00Z',
    updatedAt: '2026-02-27T08:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '4' — Ghost of Yōtei
  // Sucker Punch Productions | Oct 2, 2025
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '4',
    titulo: 'Ghost of Yōtei',
    slug: 'ghost-of-yotei',
    sinopsis:
        'En 1603, una nueva guerrera llamada Atsu emprende su viaje por las tierras que rodean el Monte Yōtei, en el extremo norte de Japón. Vastas praderas, tundras nevadas y peligrosas montañas la esperan mientras busca venganza contra aquellos que destruyeron todo lo que amaba.',
    fechaLanzamiento: '2025-10-02',
    desarrollador: 'Sucker Punch Productions',
    editor: 'Sony Interactive Entertainment',
    imagenPortada: 'https://img.youtube.com/vi/7z7kqwuf0a8/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/sLcksHR30UA/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2024-09-24T17:00:00Z',
    updatedAt: '2025-10-02T07:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '5' — Death Stranding 2: On the Beach
  // Kojima Productions | Jun 26, 2025
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '5',
    titulo: 'Death Stranding 2: On the Beach',
    slug: 'death-stranding-2-on-the-beach',
    sinopsis:
        'Sam Porter Bridges regresa en una nueva odisea post-apocalíptica. Explora nuevos mundos, conecta la red y lucha por sobrevivir en esta épica secuela de Hideo Kojima que lleva el género a territorios nunca antes explorados.',
    fechaLanzamiento: '2025-06-26',
    desarrollador: 'Kojima Productions',
    editor: 'Sony Interactive Entertainment',
    imagenPortada: 'https://img.youtube.com/vi/wbLstJHlC4U/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/wbLstJHlC4U/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2024-01-31T18:00:00Z',
    updatedAt: '2025-06-26T07:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '6' — Gears of War: E-Day
  // The Coalition | Oct 6, 2026
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '6',
    titulo: 'Gears of War: E-Day',
    slug: 'gears-of-war-e-day',
    sinopsis:
        'Catorce años antes del Gears of War original, únete a Marcus Fenix y Dom Santiago en el Día de Emergencia: el inicio del brutal ataque de las Locust. Revive el horror de Emergence Day en una precuela épica construida desde cero con Unreal Engine 5.',
    fechaLanzamiento: '2026-10-06',
    desarrollador: 'The Coalition',
    editor: 'Xbox Game Studios',
    imagenPortada: 'https://img.youtube.com/vi/EC20gLfUHeA/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/yAWz9IIQvt0/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2024-06-09T17:00:00Z',
    updatedAt: '2026-06-09T17:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '7' — God of War: Laufey
  // Santa Monica Studio | 2027
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '7',
    titulo: 'God of War: Laufey',
    slug: 'god-of-war-laufey',
    sinopsis:
        'La muerte debía ser el final, pero para Laufey —Faye—, guerrera y esposa de Kratos, una nueva aventura apenas comienza. Tras su muerte, Faye despierta en el Más Allá de los dioses y debe abrirse paso a través de reinos míticos para salvar a quienes ama.',
    fechaLanzamiento: '2027-01-01',
    desarrollador: 'Santa Monica Studio',
    editor: 'Sony Interactive Entertainment',
    imagenPortada: 'https://img.youtube.com/vi/HLMX2w3cwuE/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/MCg5A1Jupi0/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2026-06-02T17:00:00Z',
    updatedAt: '2026-06-02T17:30:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '8' — Persona 6
  // Atlus | TBA 2027
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '8',
    titulo: 'Persona 6',
    slug: 'persona-6',
    sinopsis:
        'Una historia completamente nueva está a punto de revelarse. La muy esperada siguiente entrega de la icónica serie de RPG de Atlus llega a Xbox Series X|S, PC y PlayStation 5 con un relato inédito que mezcla el drama cotidiano con lo sobrenatural.',
    fechaLanzamiento: '2027-01-01',
    desarrollador: 'Atlus',
    editor: 'Atlus',
    imagenPortada: 'https://img.youtube.com/vi/OaWZAAQ6Qrs/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/CL-q0HgfMOY/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2026-06-09T17:00:00Z',
    updatedAt: '2026-06-09T17:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '9' — Final Fantasy VII Revelation
  // Square Enix | Primavera 2027
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '9',
    titulo: 'Final Fantasy VII Revelation',
    slug: 'final-fantasy-vii-revelation',
    sinopsis:
        'La conclusión épica de la trilogía remake de Final Fantasy VII. Con el tema de la resolución, los personajes se preparan para la batalla final. Disponible simultáneamente en todas las plataformas en la primavera de 2027.',
    fechaLanzamiento: '2027-04-01',
    desarrollador: 'Square Enix Creative Business Unit I',
    editor: 'Square Enix',
    imagenPortada: 'https://img.youtube.com/vi/VMI45v9fbeI/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/VMI45v9fbeI/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2026-06-05T19:00:00Z',
    updatedAt: '2026-06-05T19:00:00Z',
  ),

  // ─────────────────────────────────────────────
  // idJuego: '10' — Clair Obscur: Expedition 33
  // Sandfall Interactive | Apr 24, 2025
  // GOTY 2025 — 9 premios en The Game Awards
  // ─────────────────────────────────────────────
  GameEntity(
    idJuego: '10',
    titulo: 'Clair Obscur: Expedition 33',
    slug: 'clair-obscur-expedition-33',
    sinopsis:
        'Cada año, la Pintora despierta y escribe un número en su monolito, condenando a muerte a todos los que tienen esa edad. La Expedición 33 es el último intento de la humanidad para poner fin a este ciclo eterno. Un RPG de ensueño con combate por turnos y narrativa magistral.',
    fechaLanzamiento: '2025-04-24',
    desarrollador: 'Sandfall Interactive',
    editor: 'Kepler Interactive',
    imagenPortada: 'https://img.youtube.com/vi/2VaLOc1FpSo/maxresdefault.jpg',
    bannerUrl: 'https://img.youtube.com/vi/2VaLOc1FpSo/maxresdefault.jpg',
    estado: 'activo',
    destacado: 'si',
    createdAt: '2024-06-10T20:00:00Z',
    updatedAt: '2025-04-24T07:00:00Z',
  ),
];

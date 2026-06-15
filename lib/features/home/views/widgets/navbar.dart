import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_tv/core/widgets/button_circle_avatar.dart';
import 'package:game_tv/core/widgets/custom_icon_button.dart';
import 'package:game_tv/features/home/views/widgets/logo.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> navBar = [
    //   {'title': 'INICIO', 'route': 'home'},
    //   {'title': 'JUEGOS', 'route': 'games'},
    //   {'title': 'TRAILERS', 'route': 'trailers'},
    //   {'title': 'NOVEDADES', 'route': 'news'},
    //   {'title': 'MI LISTA', 'route': 'mylist'},
    // ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // for (var i = 0; i < navBar.length; i++)
            //   TextButton(
            //     onPressed: null,
            //     child: Text(
            //       navBar[i]['title'],
            //       style: TextStyle(color: Colors.grey),
            //     ),
            //   ),
            CustomIconButton(icon: Icons.search, onPressed: () {}),
            CustomIconButton(onPressed: () {}, icon: CupertinoIcons.bell_solid),
            ButtonCircleAvatar(
              onPressed: () {},
              backgroundColor: Colors.deepPurple,
              focusedBorderColor: Colors.white,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

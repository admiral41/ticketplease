import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketplease/utils/my_theme.dart';

import 'dummy_data.dart';

class MoviesItems extends StatelessWidget {
  const MoviesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 150 + 80,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: GestureDetector(
                onTap: (() {
                  print(movies[i].title);
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                      movies[i].bannerUrl,
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(height: 8),
                    Text(
                      movies[i].title,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: MyTheme.redBorder,
                        ),
                        Text(
                          "${movies[i].like}",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

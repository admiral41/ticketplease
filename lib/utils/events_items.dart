import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketplease/Models/event_model.dart';
import 'package:ticketplease/utils/my_theme.dart';

import 'dummy_data.dart';

class EventItems extends StatelessWidget {
  final List<EventModel> events;
  const EventItems({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: events.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
              child: GestureDetector(
                onTap: (() {
                  print(events[i].title);
                }),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          events[i].bannerUrl,
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(height: 8),
                    Text(
                      events[i].title,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                    Row(
                      children: [
                        Text(
                          "${events[i].description}",
                          style: const TextStyle(fontSize: 10),
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

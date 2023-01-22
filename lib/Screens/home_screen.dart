import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketplease/Controller/auth_controller.dart';
import 'package:ticketplease/utils/constants.dart';
import '../utils/dummy_data.dart';
import '../utils/my_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String city = cities[0];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: picUrl,
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    DropdownButton<String>(
                        value: city,
                        dropdownColor: MyTheme.statusBar,
                        isDense: true,
                        icon: Icon(Icons.keyboard_arrow_down,color: Colors.white.withOpacity(0.8)),
                        items: cities
                            .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                        )
                            .toList(),
                        onChanged: (st) {
                          setState(() {
                            city = st!;
                          });
                        }),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

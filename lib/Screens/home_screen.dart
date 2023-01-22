import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketplease/Controller/auth_controller.dart';
import 'package:ticketplease/utils/constants.dart';
import 'package:ticketplease/utils/custom_slider.dart';
import '../utils/dummy_data.dart';
import '../utils/menu_items.dart';
import '../utils/movies_items.dart';
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
    final Size size=MediaQuery.of(context).size;
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
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.white.withOpacity(0.8)),
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
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/search.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/notification.svg")),
            ],
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height*0.22,
                width: size.width,
                color: Colors.white,
                child: PageView.builder(
                    itemBuilder: (_, i) {
                  return CustomSlider(
                    index: 1,
                  );
                }),
              ),
               Padding(
                padding:  EdgeInsets.only(left: 20.0,top: 20),
                child: Text("SEAT CATEGORY",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),
              ),
              MenuItems(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 20),
                child: Text("RECOMMENDED SEATS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),
              ),
              MoviesItems(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dummy_data.dart';
class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: menus.length,
          itemBuilder:  (_,i){
        return Padding(
          padding: const EdgeInsets.only(top: 10,left: 20,right: 10),
          child: GestureDetector(
            onTap: ((){
              print(menus[i].name);
            }),
            child: Column(
              children: [
                SvgPicture.asset(menus[i].asset,height: 40,width: 40,),
                SizedBox(height: 5),
                Text(menus[i].name,style: TextStyle(color: Colors.black.withOpacity(0.6)),)
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}

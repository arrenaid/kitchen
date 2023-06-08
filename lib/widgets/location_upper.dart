import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constans.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
          children: [
            SvgPicture.asset(iconPin),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Санкт-Петербург',style: tsHeadline1,),
                Text('12 Августа, 2023', style: tsSubhead1,)
              ],
            ),
            const Expanded(child: SizedBox(width: 1,)),
            CircleAvatar(child: Image.asset(imgAvatar),),
          ]
      ),
    );
  }
}

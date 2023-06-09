import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constans.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        height: 42,
        child: Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(iconPin),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Санкт-Петербург',style: tsHeadline1,),
                  Text('12 Августа, 2023',
                    style: tsSubhead1.copyWith(color: Colors.black.withOpacity(0.5)),)
                ],
              ),
              const Expanded(child: SizedBox(width: 1,)),
              const AvatarButton(),
            ]
        ),
      ),
    );
  }
}

class AvatarButton extends StatelessWidget {
  const AvatarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: CircleAvatar(
        radius: 22,
        child: Image.asset(imgAvatar),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partido_republicano_peruano/constants.dart';
import 'package:partido_republicano_peruano/screens/customer/details/componentes/icon_card.dart';

class DetailsAutoridadNacional extends StatelessWidget {
  Map<String, dynamic>? representative;

  DetailsAutoridadNacional({this.representative});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
              child: SizedBox(
                height: 695,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding * 3),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                icon: SvgPicture.asset(
                                    "assets/icons/back_arrow.svg"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Spacer(),
                            IconCard(icon: "assets/icons/sun.svg"),
                            IconCard(icon: "assets/icons/icon_2.svg"),
                            IconCard(icon: "assets/icons/icon_3.svg"),
                            IconCard(icon: "assets/icons/icon_4.svg"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 635,
                      width: 300,
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(63),
                          bottomLeft: Radius.circular(63),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 60,
                            color: kPrimaryColor.withOpacity(0.29),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(this.representative!["image"]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: this.representative!["name"],
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: this.representative!["description"],
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "45",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
            SizedBox(height: kDefaultPadding),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 190,
                  height: 60,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                    ),
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text("Description"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partido_republicano_peruano/screens/customer/details_autoridades_nacionales/details_screen.dart';
import 'package:partido_republicano_peruano/screens/customer/home/components/my_bottom_nav_bar.dart';

import 'package:partido_republicano_peruano/constants.dart';
import 'package:partido_republicano_peruano/screens/customer/home/components/title_with_more_bbtn.dart';
import 'package:partido_republicano_peruano/screens/customer/home/components/title_with_more_btn2.dart';
import 'package:partido_republicano_peruano/services/firestore_services.dart';
import 'package:partido_republicano_peruano/utils/search_product.dart';

class HomeScreen extends StatelessWidget {
  FirestoreService _representativeFirestoreService = new FirestoreService(collection: 'representatives');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
              height: 170,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: 10 + kDefaultPadding,
                    ),
                    height: 200,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text('P R P',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                        Spacer(),
                        Image.asset("assets/images/logo.png")
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: kPrimaryColor.withOpacity(0.23),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: "search",
                                hintStyle: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          //SvgPicture.asset("assets/icons/search.svg"),
                          IconButton(
                              onPressed: () async {
                                final result = await showSearch(
                                    context: context,
                                    delegate: SearchProduct(
                                        listRepresentatives:
                                            await _representativeFirestoreService
                                                .getAllRepresentatives()));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TitleWithMoreBtn(),
            FutureBuilder(
              future: _representativeFirestoreService.getRepresentatives(
                  categoryId: "UEPaTZfUHzmO8dIRc5ML"),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List<Map<String, dynamic>> representatives = snap.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: representatives
                          .map<Widget>(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsAutoridadNacional(
                                              representative: e,
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: kDefaultPadding,
                                  top: kDefaultPadding / 2,
                                  bottom: kDefaultPadding * 2.5,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 175,
                                      height: 200,
                                      padding:
                                          EdgeInsets.all(kDefaultPadding / 2),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            e["image"],
                                          ),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                          // bottomLeft: Radius.circular(15),
                                          // bottomRight: Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 10.0),
                                            blurRadius: 50,
                                            color:
                                                kPrimaryColor.withOpacity(0.23),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                          // bottomLeft: Radius.circular(15),
                                          // bottomRight: Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 10.0),
                                            blurRadius: 50,
                                            color:
                                                kPrimaryColor.withOpacity(0.23),
                                          ),
                                        ],
                                      ),
                                      width: 175,
                                      height: 50,
                                      child: Row(
                                        children: <Widget>[
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      e["name"]?.toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button,
                                                ),
                                                TextSpan(
                                                  text: e["description"]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: kPrimaryColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            TitleWithMoreBtn2(),
            FutureBuilder(
              future: _representativeFirestoreService.getRepresentatives(
                  categoryId: "wQAPfJESxvFfOxvEhRmQ"),
              builder: (BuildContext context, AsyncSnapshot snap) {
                if (snap.hasData) {
                  List<Map<String, dynamic>> representatives = snap.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: representatives
                          .map<Widget>(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsAutoridadNacional(
                                              representative: e,
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: kDefaultPadding,
                                  top: kDefaultPadding / 2,
                                  bottom: kDefaultPadding * 2.5,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 175,
                                      height: 200,
                                      padding:
                                          EdgeInsets.all(kDefaultPadding / 2),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            e["image"],
                                          ),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                          // bottomLeft: Radius.circular(15),
                                          // bottomRight: Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 10.0),
                                            blurRadius: 50,
                                            color:
                                                kPrimaryColor.withOpacity(0.23),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                          // bottomLeft: Radius.circular(15),
                                          // bottomRight: Radius.circular(15),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 10.0),
                                            blurRadius: 50,
                                            color:
                                                kPrimaryColor.withOpacity(0.23),
                                          ),
                                        ],
                                      ),
                                      width: 175,
                                      height: 50,
                                      child: Row(
                                        children: <Widget>[
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      e["name"]?.toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .button,
                                                ),
                                                TextSpan(
                                                  text: e["description"]
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: kPrimaryColor
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

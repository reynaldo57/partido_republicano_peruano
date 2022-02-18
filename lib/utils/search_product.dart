

import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/screens/customer/details_autoridades_nacionales/details_screen.dart';
import 'package:partido_republicano_peruano/widgets/item_search_widget.dart';

class SearchProduct extends SearchDelegate {

  List<Map<String,dynamic>> listRepresentatives = [];

  String result = "";

  SearchProduct({required this.listRepresentatives});




  @override
  String get searchFieldLabel => "Buscar";

  @override
  ThemeData appBarTheme(BuildContext context){
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Color(0xFFF44336),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white54,
          fontSize: 16.0
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFFF44336),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      )
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, result);
      },
    );
  }


  @override
  Widget buildResults(BuildContext context) {

    List<Map<String, dynamic>> suggestions = listRepresentatives.where((element) {
      return element["name"].toLowerCase().contains(query.toLowerCase());
    }).toList();

    return
      ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index){
          return ItemSearchWidget(
            image: suggestions[index]['image'],
            title: suggestions[index]['name'],
            country: suggestions[index]['description'],
            goTo: DetailsAutoridadNacional(representative: suggestions[index]),
          );
        },
      );

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<Map<String, dynamic>> suggestions = listRepresentatives.where((element) {
      return element["name"].toLowerCase().contains(query.toLowerCase());
    }) .toList();

    return
        ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (BuildContext context, int index){
            return ItemSearchWidget(
                image: suggestions[index]['image'],
                title: suggestions[index]['name'],
                country: suggestions[index]['description'],
                goTo: DetailsAutoridadNacional(representative: suggestions[index]),
            );
          },
        );

  }
}

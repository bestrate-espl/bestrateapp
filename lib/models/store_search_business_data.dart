import 'package:flutter/foundation.dart';

class SearchBusinessData{
  final int id;
  final String name;

  SearchBusinessData({required this.id, required this.name});

   factory SearchBusinessData.from(Map<String, dynamic> map){
     return SearchBusinessData(
         id : map['id'],
         name : map['name']
     );
   }

   Map<String, dynamic> toMap(){
     return {
       'id' : id,
       'name' : name
     };
   }
}
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Livre {
  static String baseUrl = "https://jsonplaceholder.typicode.com";
  static Future<List> getAllLivre() async {
    try {
      debugPrint("Je rentre dans me getAllLivre");

      var res = await http.get(Uri.parse('http://10.0.2.2:8080/JSON_Produits'));
      if (res.statusCode == 200) {
        debugPrint("Ok body recupéréZeg");
        return jsonDecode(res.body);
      } else {
        debugPrint("erreur serveur");

        return Future.error("erreur serveur");
      }
    } catch (err) {
      debugPrint("Dans le catch");

      debugPrint(err.toString());

      return Future.error(err);
    }
  }

  static Login(BuildContext context, login, password) async {
    try {
      debugPrint("test1");
      var connection = {"Email": login, "Password": password};
      debugPrint("test4");
      var res = await http.post(
          Uri.parse("http://10.0.2.2:8080/JSON_connexion"),
          body: connection);

      if (res.statusCode == 200) {
        debugPrint("test2");
        Navigator.pushNamed(context, '/liste');
      } else {
        debugPrint("test3");
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      debugPrint("erreur");
      return Future.error(err);
    }
  }

  static ajout(BuildContext context, title, body) async {
    try {
      // tu fait un json avec les infos du prduits
      //  Tu l'ajoute dans la bdd
      //    T'appel l'API ( serveur )
      //      Tu pass en parem le json creer precedament
      //

      var data = {"libel": title, 'descProd': title, 'prix': body};
      var res = await http
          .post(Uri.parse("http://10.0.2.2:8080/JSON_add_product"), body: data);

      if (res.statusCode == 200) {
        debugPrint("test2");
        Navigator.pushNamed(context, '/liste');
      } else {
        debugPrint("test3");
        Navigator.pushNamed(context, '/');
      }
    } catch (err) {
      debugPrint("erreur");
      return Future.error(err);
    }
  }
}

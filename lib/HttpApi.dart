import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpApi extends StatefulWidget {
  HttpApi({Key key}) : super(key: key);

  @override
  _HttpApiState createState() => _HttpApiState();
}

class _HttpApiState extends State<HttpApi> {
  List jsonData;
  Widget appBarTitle = Text('HttpIcon');
  Icon appBarIcon = Icon(Icons.search);
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.allData();
  }

  Future allData() async {
    var url =
        'https://raw.githubusercontent.com/samayo/country-json/master/src/country-by-capital-city.json';
    var response = await http.get(url);

    setState(() {
      jsonData = json.decode(response.body);
    });

    // var listData = jsonData
    //     .forEach((f) => print("country: f['country'],capital: f['capital'],"));
    // print(response.statusCode);
    // return listData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: [
          IconButton(
              icon: appBarIcon,
              onPressed: () {
                setState(() {
                  if (this.appBarIcon.icon == Icons.search) {
                    appBarIcon = Icon(
                      Icons.close,
                    );
                    appBarTitle = TextField(
                      controller: searchController,
                      onChanged: (ind) {
                        print('ind $ind');
                        jsonData.where((e) {
                          return e['conutry'].contains(ind);
                          // var whereIS = e['country'].contains(ind);
                          // setState(() {
                          //   e['country'] = whereIS;
                          // });
                          // List whereIs = e['country'].contains(ind);
                          // if (e['country'].contains(ind)) {
                          //   for (var jsonD in jsonData) {
                          //     setState(() {
                          //       jsonData = whereIs;
                          //     });
                          //   }
                          // }
                          // return true;
                        }).toList();
                      },
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                  } else {
                    appBarIcon = Icon(Icons.search);
                    appBarTitle = Text('Http Api');
                  }
                });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: jsonData == null ? 0 : jsonData.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(jsonData[index]['country']),
            trailing: Text(jsonData[index]['city'] == null
                ? 'Null'
                : jsonData[index]['city']),
          );
        },
      ),
    );
  }
}

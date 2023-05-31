import 'package:flutter/material.dart';
import 'package:hive_model/db/uzum_db.dart';
import 'package:hive_model/model/uzumModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive_model"),
      ),
      body: FutureBuilder(
          future: UzumDBService().checkBox(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.data is String) {
              return Center(
                child: Text(snapshot.data.toString()),
              );
            } else {
              var data = snapshot.data as UzumModel;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                          child: Text(data.yozgisavdo![index].narx.toString())),
                          SizedBox(width: 10,height: 20,),
                      Center(
                          child:
                              Text(data.yozgisavdo![index].title.toString())),
                      // Expanded(
                      //     child: Center(
                      //   child: Image.network(
                      //       data.yozgisavdo![index].img.toString()),
                      // ))
                    ],
                  );
                },
                itemCount: data.yozgisavdo!.length,
              );
            }
          }),
    );
  }
}

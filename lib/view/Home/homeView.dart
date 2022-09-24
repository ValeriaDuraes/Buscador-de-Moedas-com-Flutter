import 'package:flutter/material.dart';
import 'package:money_search/data/MoneyController.dart';
import 'package:money_search/model/MoneyModel.dart';
import 'package:money_search/model/listPersonModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

/// instancia do modelo para receber as informações
List<ListPersonModel> model = [];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de pessoas'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: FutureBuilder<List<ListPersonModel>>(
          future: MoneyController().getListPerson(),
          builder: (context, snapshot) {
            /// validação de carregamento da conexão
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            /// validação de erro
            if (snapshot.error == true) {
              return SizedBox(
                height: 300,
                child: Text("Vazio"),
              );
            }
//  List<ListPersonModel> model = [];
            /// passando informações para o modelo criado
            model = snapshot.data ?? model;
            model.sort(
              (a, b) => a.name!.compareTo(b.name!),
            );
            model.removeWhere((pessoa) => pessoa.id == "10");
            model.removeWhere((pessoa) => pessoa.name == "Miss Kim Keebler");
            model.removeWhere((pessoa) => pessoa.name == "Hope Hickle");
            model.add(ListPersonModel(avatar: "https://pbs.twimg.com/profile_images/420370594/IMG_3253_400x400.JPG",id: "56", name: "Arnaldo Hidalgo"));
            model.add(ListPersonModel(avatar: "https://media-exp1.licdn.com/dms/image/D5603AQHr31SygX288A/profile-displayphoto-shrink_800_800/0/1649272999218?e=2147483647&v=beta&t=yDc8ARqHHhLbgLAX6yt3LKOY20-vnlYWhvhSMlDU7Rw", name: "Ana Beatriz", id: "99"));
            model.forEach((pessoa) {
                if(pessoa.id == "9") {
                  pessoa.avatar = null;
              }
            });
              
            return ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  ListPersonModel item = model[index];
                  return ListTile(
                    leading: Image.network
                    (errorBuilder: (context, error, stackTrace) {
                      return Container();
                    },item.avatar ?? ""),
                    title: Text(item.name ?? ""),
                    trailing: Text(item.id ?? ""),
                  );
                });
            // ListView.builder(
            //   shrinkWrap: true,
            //   // physics: NeverScrollableScrollPhysics(),
            //   itemCount: model.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     ListPersonModel item = model[index];
            //     // tap(ListPersonModel item) {
            //     //   Navigator.push(
            //     //       context,
            //     //       MaterialPageRoute(
            //     //           builder: (context) => Person(
            //     //                 item: item,
            //     //               )));
            //     // }

            //     return GestureDetector(
            //       // onTap: (() => tap(item)),
            //       child: ListTile(
            //         leading: Image.network(item.avatar ?? ""),
            //         title: Text(item.name ?? ""),
            //         trailing: Text(item.id ?? ""),
            //       ),
            //     );
            //   },
            // );
          },
        ));
  }

  Future<Null> refresh() async {
    setState(() {});
  }
}

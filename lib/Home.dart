import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    for(int i =0;  i <=10 ; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Item ";
      item["descricao"] = "Descrição ${i} Item ";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){

              return ListTile(

                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
                onTap: (){
                },

                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(15),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                          content: Text(_itens[indice]["descricao"]),
                          actions: <Widget>[
                            FlatButton(
                              splashColor: Colors.greenAccent,
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sim",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),

                            RaisedButton(
                              onPressed: (){
                                Navigator.pop(context);

                              },
                              child: Text(
                                "Não",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              color: Colors.redAccent,
                            ),
                          ],
                          contentPadding: EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                        );
                      }
                  );
                },
              );
            }
        ),
      ),
    );
  }
}

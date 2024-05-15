import 'package:flutter/material.dart';
import 'package:interview/model/apitest.dart';

import '../model/customerapi.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}


class _CustomerViewState extends State<CustomerView> {


  List<Datum>? datum = [];
  bool isLoading = true;

  void _getData ()  async {
    datum = await CustomerService().service();
    setState(() {
      isLoading = false;
    });

  }

  @override
  void initState() {
    _getData();
    super.initState();
  }


  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return  Scaffold(
      appBar: AppBar(backgroundColor:Colors.green,title: Text("Customer Details",style: TextStyle(
        fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
      ),)
      ),

      body:

          datum == null || datum!.isEmpty ?

              Center(child: CircularProgressIndicator(),)   :



      ListView.builder(
        itemCount: datum!.length,
       itemBuilder: (context, index) {
         return

              Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   SizedBox(
                     height: 10,
                   ),
                   Container(
                     height: 200,
                     width: width,
                     margin: EdgeInsets.all(10),

                     decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),
                     borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
                     child: Column(children: [

                       Text(" Name  : ${datum![index].name}",style: TextStyle(
                       fontSize: 20,color: Colors.pink,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,


                     )
                       ,),Text("Year ${datum![index].year}",style: TextStyle(
                       fontSize: 30,color: Colors.pink,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,


                     )
                       ,),Text(" color  ${datum![index].color}",style: TextStyle(
                       fontSize: 30,color: Colors.pink,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,


                     )
                       ,),Text(" Pantlone Value ${datum![index].pantoneValue}",style: TextStyle(
                       fontSize: 30,color: Colors.pink,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,


                     )
                       ,)
                       ]
                   )
                   )
                 ],

             );
       },
      ) ,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentapp/component/colors.dart';
import 'package:paymentapp/controllers/data_controllers.dart';
import 'package:paymentapp/pages/payment_page.dart';
import 'package:paymentapp/widgets/buttons.dart';
import 'package:paymentapp/widgets/large_buttons.dart';
import 'package:paymentapp/widgets/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final DataControllers _controllers = Get.put(DataControllers());
  @override
  Widget build(BuildContext context) {
    print(_controllers.list);
    double h = MediaQuery
        .of(context)
        .size
        .height;
    // ignore: unused_local_variable
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      // ignore: sized_box_for_whitespace
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx((){
              if(_controllers.loading==false){
                return Center(
                  child: Container(
                    width: 100,
                      height: 100,
                      child: const CircularProgressIndicator()),
                );
              }else{
                return _listBills();
              }
            }),
            _payButton(),


          ],
        ),
      ),
    );
  }

  _headSection() {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 310,
      // color: Colors.blue,
      child: Stack(
        children: [
          _mainBackground(),
          // _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
        right: 58,
        bottom: 15,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet<dynamic>(
              isScrollControlled: true,
              barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context, builder: (BuildContext bc){
              return Container(
                height: MediaQuery.of(context).size.height-240,
                child: Stack(
                  children: [

                    Positioned(

                      bottom: 0,
                        child: Container(
                        color: const Color(0xFFeef1f4).withOpacity(0.7),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height-300
                    )),
                    Positioned(
                      top: 40, //if phone top:0,
                      right: 0, //if phone right:58,

                        child: Container(
                          padding: const EdgeInsets.only(top:5, bottom: 25),
                      width: 60,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(29)
                      ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //button 1
                              AppButtons(icon: Icons.cancel,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: (){Navigator.pop(context);},
                              ),
                             //button 2
                              AppButtons(icon: Icons.add,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: (){},
                                text: "Add Bill",
                              ),
                               //button 3
                              AppButtons(icon: Icons.history,
                                iconColor: AppColor.mainColor,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: (){},
                                text: "History",
                              )
                            ],
                          ),
                    ))
                  ],
                ),
              );
            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage("images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0, 1),
                      color: const Color(0xFF11324d).withOpacity(0.2))
                ]),
          ),
        ));
  }
  _mainBackground() {
    return Positioned(
      bottom: 10,
      left: 0,
      child: Container(
        height: 300,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "images/background.png"
                )
            )
        ),
      ),
    );
  }
  // _curveImageContainer() {
  //   return Positioned(
  //       left: 0,
  //       right: -2,
  //       bottom: 10,
  //       child: Container(
  //         height: MediaQuery.of(context).size.height * 0.1,
  //         decoration: const BoxDecoration(
  //             image: DecorationImage(
  //                 fit: BoxFit.cover, image: AssetImage("images/curve.png"))),
  //       ));
  // }
  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
             itemCount: _controllers.list.length,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                height: 130,
                width: MediaQuery.of(context).size.width-20,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1, 1),
                          blurRadius: 20.0,
                          spreadRadius: 10)
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 3, color: Colors.grey),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          _controllers.list[index]["img"]
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _controllers.list[index]["brand"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "ID: 846594",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.idColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ]),
                          SizedText(
                              text: _controllers.list[index]["more"],
                              color: AppColor.green),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  _controllers.list[index]["status"]=!_controllers.list[index]["status"];
                                  print(_controllers.list[index]["status"]);
                                  _controllers.list.refresh();
                                  print(_controllers.newList.length);
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: _controllers.list[index]["status"]==false?AppColor.selectBackground:AppColor.green
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: _controllers.list[index]["status"]==false?AppColor.selectColor:Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                "\Ugsh."+_controllers.list[index]["due"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.mainColor,
                                ),
                              ),
                              Text(
                                _controllers.list[index]["date"],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.idColor,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
  _payButton(){
    return Positioned(
      bottom: 20,
        child: AppLargeButton(text: "Pay all bills",
          textColor: Colors.white, onTap: (){Get.to(()=>const PaymentPage());},
        )
    );

  }
  _textContainer(){
    return const Stack(
      children: [
        Positioned(
            left: 0,
            top: 100,
            child:
            Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293952)
              ),
            )
        ),
        Positioned(
            left: 40,
            top: 80,
            child:
            Text(
              "My Bills",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )
        ),
      ],
    );
  }
}

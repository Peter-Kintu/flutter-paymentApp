import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentapp/widgets/buttons.dart';
import 'package:paymentapp/widgets/large_buttons.dart';
import '../component/colors.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
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

      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        height: h,
        width: w,
        decoration: const BoxDecoration(
            color: Colors.brown
          // image: DecorationImage(
          //     fit: BoxFit.fill,
          //     image: AssetImage(
          //         "images/paymentbackground.png"
          //     )
          // )
        ),
        child: Column(
          children: [
            Container(

              width: double.maxFinite,
              height: h * 0.14,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          "images/success.png"
                      )
                  )
              ),
            ),
            const Text(
              "sucessful!",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.green,
              ),
            ),

            const Text(
              "Payment is completed for two bills!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),

            SizedBox(height: h * 0.03,),
            Container(
              height: 200, //if phone h=160
              width: 700, //if phone w=350
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  )
              ),

              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 15, left: 20, bottom: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green
                                ),
                                child: const Icon(
                                  Icons.done, size: 30, color: Colors.white,),

                              ),
                              const SizedBox(width: 10,),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Airtel Uganda",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "ID: 4759379",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),

                              const SizedBox(width: 20,),
                              const Column(
                                children: [

                                  //this text is empty because it is occupying some space
                                  const Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),

                                  //this is the actual text//the above text occupy the first space
                                  SizedBox(height: 10,),
                                  Text(
                                    "Ugsh.1500000",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Divider(
                            thickness: 2, color: Colors.grey.withOpacity(0.5),)
                        ],
                      ),
                    );

                  },

                ),
              ),
            ),
            const SizedBox(height:10),// if phone h*0.05?,
            const Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5,),// if phone h=10?
                Text(
                  "UgSh.1500000",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                       fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5) ,//if phone h*0.05?
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButtons(icon: Icons.share_sharp, onTap: (){}, text: "share", iconColor: Colors.yellow, textColor: Colors.grey,),
                SizedBox(width: h*0.07,),
                AppButtons(icon: Icons.print_outlined, onTap: (){}, text: "share",iconColor: Colors.yellow, textColor: Colors.grey,)

              ],
            ),
            const SizedBox(height: 7),//if phone h*0.02,?
            AppLargeButton(text: "Done", backgroundColor: Colors.white, textColor: AppColor.mainColor,onTap: (){Get.back();},)
          ],
        ),
      ),

    );
  }
}

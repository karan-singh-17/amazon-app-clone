import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/screens/admin_side/services/admin_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order.dart';
import '../../provider/user_provider.dart';
import 'package:intl/intl.dart';

class order_details extends StatefulWidget {
  static const routeName = "/order-details";
  Order order;

  order_details({super.key, required this.order});

  @override
  State<order_details> createState() => _order_detailsState();
}

class _order_detailsState extends State<order_details> {
  int order_status = 0;
  AdminServices adminServices = new AdminServices();

  void changeOrderstatus(int status){
    adminServices.changeOrderStatus(context: context, status: status, order: widget.order, onSuccess: (){
      setState(() {
        order_status +=1;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    order_status = widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 29, 201, 192),
                    Color.fromARGB(255, 125, 221, 216),
                  ],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            title: Text("ORDER DETAILS"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "View Order Details",
                        style: TextStyle(
                            fontSize: 20, letterSpacing: 3, wordSpacing: 3),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order Date :"),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  DateFormat().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          widget.order.orderedAt)),
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order ID :  "),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  widget.order.id,
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub Total : "),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "₹ " + widget.order.totalPrice.toString(),
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping Address :"),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  widget.order.address,
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ordered Items",
                        style: TextStyle(
                            fontSize: 20, wordSpacing: 2.0, letterSpacing: 3.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < widget.order.products.length;
                                i++)
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      widget.order.products[i].images[0],
                                      height: 100,
                                      width: 120,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.order.products[i].name,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Qty: ${widget.order.quantity[i]}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tracking",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                  child: Stepper(
                      controlsBuilder: (context, details) {
                        if(user.type == 'admin' && order_status < 3){
                          return Padding(
                            padding: const EdgeInsets.only( top: 8.0),
                            child: Container(
                              width: 150.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.orange, Colors.orangeAccent],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ElevatedButton(
                                onPressed: (){
                                  changeOrderstatus(details.currentStep);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'D O N E',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return SizedBox();
                      },
                      currentStep: order_status,
                      physics: NeverScrollableScrollPhysics(),
                      steps: [
                        Step(
                            title: Text("Order Placed"),
                            content: Text("Your order has been placed."),
                        isActive: order_status >= 0,
                          state: order_status >= 0 ? StepState.complete : StepState.indexed
                        ),
                        Step(
                            title: Text("Shipped"),
                            content: Text(
                                "Your order has been shipped and will be out for delivery in 1-2 days."),
                          isActive: order_status >= 1,
                            state: order_status >= 1 ? StepState.complete : StepState.indexed
                        ),
                        Step(
                            title: Text("Out For Delivery"),
                            content: Text("Your order is out for delivery."),
                          isActive: order_status >= 2,
                            state: order_status >= 2 ? StepState.complete : StepState.indexed),

                        Step(
                            title: Text("Order Completed"),
                            content:
                                Text("Your order has been delivered. Enjoy."),
                          isActive: order_status >= 3,
                            state: order_status >= 3 ? StepState.complete : StepState.indexed)
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}

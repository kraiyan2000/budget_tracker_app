import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final amountfield = TextEditingController();
  final items = TextEditingController();
  final pricereset = TextEditingController();

  num itemPrice = 0;
  num initAmount = 0;
  num initAmountSum = 0;
  num addBillAmount = 0;
  var itemStore = [];
  var priceStore = [];
  var priceuse = [];
  var initAmountTrack = [];

  num showBalance = 0;
  num DisplayBalance = 0;
  num mainAmount = 0;

  void _initvalue() {
    setState(() {
      initAmountTrack.add(initAmount);
      initAmountSum += initAmount;

      amountfield.clear();
      print('${initAmountSum}');
      mainAmount = initAmountSum - DisplayBalance;
      // print('${initAmount}');
    });
  }

  void _combine() {
    if (items.text == "") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "WARNING!",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: const Text(
            "Please Fill the Required Details",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "OK",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      );
    } else {
      itemStore.add(items.text);
      priceStore.add(itemPrice);
      priceuse.add(itemPrice);
      print("${itemStore}:${priceStore}");
      items.clear();
      pricereset.clear();

      priceuse.forEach((e) {
        showBalance += e;
      });
      priceuse.clear();
      DisplayBalance += showBalance;
      showBalance = 0;
      mainAmount = initAmountSum - DisplayBalance;
      print("${priceStore}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget Tracker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.lightBlue,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 180,
                          width: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Balance Amonunt',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹${mainAmount}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bill Amonunt',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹${DisplayBalance}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        //First add item box section

                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Add initial Amount",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 270,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        style: TextStyle(color: Colors.white),
                                        controller: amountfield,
                                        onChanged: (value) {
                                          setState(() {
                                            initAmount = num.parse(value);
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          hintText: "Enter initial amount",
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors
                                                  .white, // Set the border color to white
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: _initvalue,
                                      child: Text("Add"),
                                      style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(100.0, 50.0))))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Second add item box section
              Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),

                        // Container section and and second section startrs

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Add Item and Price",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 70,
                                  width: 270,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: items,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: "Enter items",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors
                                                .white, // Set the border color to white
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    controller: pricereset,
                                    onChanged: (value) {
                                      setState(() {
                                        itemPrice = num.parse(value);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Price",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors
                                                .white, // Set the border color to white
                                          ),
                                        )),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ElevatedButton(
                                  onPressed: _combine,
                                  child: Text("Add items"),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          Size(300.0, 40.0)))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                width: double.infinity,
                // height: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Your expense',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 200,
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Text(
                                        '${index + 1}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      title: Text(
                                        "${itemStore[index]}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      trailing: Text("₹${priceStore[index]}",
                                          style: TextStyle(fontSize: 18)),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 2,
                                      height: 20,
                                    );
                                  },
                                  itemCount: itemStore.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

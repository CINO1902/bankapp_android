import 'package:bankapp/linkfile/providerlink/loader.dart';

import 'package:bankapp/linkfile/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class airtime extends StatefulWidget {
  const airtime({super.key});

  @override
  State<airtime> createState() => _airtimeState();
}

class _airtimeState extends State<airtime> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late FixedExtentScrollController _scrollController;
  late TextEditingController _controller;
  String? bank;
  final items = ['MTN', 'GLO', 'Airtel', '9mobile'];
  final airtimeiage = [
    'images/network/mtn.svg.png',
    'images/network/glo.png.jpeg',
    'images/network/Airtel.png',
    'images/network/9mobile.png.jpeg'
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: items[index]);
    _scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getdetail = Provider.of<getdetails>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Buy Airtime',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.width * 0.06,
              ),
              child: Text(
                'SOURCE ACCOUNT',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(.5)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius:
                                  MediaQuery.of(context).size.height * 0.032,
                              backgroundImage: AssetImage('images/caleb.png'),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    // horizontal: MediaQuery.of(context).size.height * 0.01,
                                    top: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      0.029,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: FittedBox(
                                      child: Text(
                                    'Caleb Oruta',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Text(
                                    'Account 1',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(.5)),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                            // horizontal: MediaQuery.of(context).size.height * 0.01,
                            vertical: MediaQuery.of(context).size.width * 0.03,
                          ),
                          height: MediaQuery.of(context).size.height * 0.023,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: FittedBox(
                              child: Text(
                            '${getdetail.balance}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.onSurface),
                          ))),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount:',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //   validator: _validateName,
                        onSaved: (value) => setState(() {
                          // ID = value!;
                        }),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.7),
                            ),

                            // hintText: 'Enter Your Email Here',
                            labelText: 'Amount',
                            labelStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Network:',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Choose Network',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.cancel))
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                              itemCount: items.length,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<choosenetwork>()
                                                        .showindex(index);
                                                  },
                                                  child: picknetwork(
                                                      context, index),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ));
                        },
                        child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 101, 101, 101)),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      airtimeiage[
                                          context.watch<choosenetwork>().group],
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      items[
                                          context.watch<choosenetwork>().group],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Phone Number:',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //validator: _validateEmail,
                        onSaved: (value) => setState(() {
                          // PIN = value!;
                        }),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 101, 101, 101),
                                  width: 1.7),
                            ),

                            // hintText: 'Enter Your Email Here',
                            labelText: '080833227654',
                            labelStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.0,
                          MediaQuery.of(context).size.height * 0.0,
                          MediaQuery.of(context).size.width * 0.0,
                          MediaQuery.of(context).size.height * 0.0,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                            ),
                            onPressed: () {
                              // _sendToServer();
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Container picknetwork(BuildContext context, int index) {
    final isSeleted = this.context.watch<choosenetwork>().index == index;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: isSeleted
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('${airtimeiage[index]}'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${items[index]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Radio(
            value: index,
            activeColor: Theme.of(context).primaryColor,
            groupValue: context.watch<choosenetwork>().group,
            onChanged: (value) {
              context.read<choosenetwork>().showindex(value);
            },
          ),
        ],
      ),
    );
  }
}

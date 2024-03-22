import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/global_var.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController txtProductName = TextEditingController(text: "Darshan");
  TextEditingController txtCustomerName = TextEditingController(text: 'Aayush');
  TextEditingController txtProductPrice = TextEditingController(text: '10');
  TextEditingController txtProductQty = TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCD6F7),
      appBar: AppBar(
        backgroundColor: const Color(0xff424874),
        leading: const Icon(CupertinoIcons.add_circled_solid,color: CupertinoColors.white,),
        title: const Text("Add Items",style: TextStyle(color: CupertinoColors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              textFieldBox(txtCustomerName, const Icon(CupertinoIcons.person_fill), "Customer Name"),
              textFieldBox(txtProductName, const Icon(CupertinoIcons.bag_fill_badge_plus), "Product Name"),
              textFieldBox(txtProductPrice, const Icon(CupertinoIcons.money_dollar), "Product Price"),
              textFieldBox(txtProductQty, const Icon(CupertinoIcons.arrow_up_bin_fill), "Product Quantity"),
              const Spacer(),
              InkWell(
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff424874),),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    int finalPrice = int.parse(txtProductQty.text) * int.parse(txtProductPrice.text);
                    productName.add(txtProductName.text);
                    productAmount.add(finalPrice);
                    productQty.add(txtProductQty.text);
                    Navigator.of(context).pushNamed('list');
                  }
                  );

                },
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
Widget textFieldBox(TextEditingController name, Icon i1, String pName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: name,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xff424874),width: 2.5)
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color(0xff424874),width: 2.5)
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: pName,
        prefixIcon: i1,
      ),
    ),
  );
}
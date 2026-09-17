import 'package:expense_tracker/core/data%20source/firebase_datasource.dart';
import 'package:expense_tracker/core/widgets/text_form_field.dart';
import 'package:expense_tracker/features/add_transaction/data/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<String> categories = [
    'food',
    'salary',
    'subscriptions',
    'cinema',
    'feul',
    'shopping',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Transaction",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 50.h),
              Text(
                "How much?",
                style: TextStyle(
                  color: Color(0xff0A0000),
                  fontSize: 18,
                  fontWeight: .w600,
                ),
              ),
              SizedBox(height: 17.h),
              Row(
                spacing: 10.w,
                children: [
                  Text(
                    "EGP",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: .w700,
                      color: Color(0xff0F0000),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: amountController,
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: .w700,
                        color: Color(0xff0F0000),
                      ),
                      keyboardType: .numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: .none,
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: .w700,
                          color: Color(0xff0F0000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      items: categories.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Category',
                        hintStyle: TextStyle(
                          color: Color(0xff91919F),
                          fontSize: 16.sp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xff26265C),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color(0xff26265C),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 37.h),
                    CustomTextFormField(
                      controller: descriptionController,
                      hintText: 'Description',
                      labelText: 'Description',
                      keyboardType: .name,
                    ),
                    SizedBox(height: 37.h),
                    Row(
                      mainAxisAlignment: .center,
                      spacing: 10.w,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            foregroundColor: Colors.white,
                            backgroundColor: true ? Colors.green : Colors.grey,
                          ),
                          child: Text('Income'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            foregroundColor: Colors.white,
                            backgroundColor: true ? Colors.red : Colors.grey,
                          ),
                          child: Text('Expense'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 76.h),
              SizedBox(
                height: 56,
                width: .infinity,
                child: ElevatedButton(
                  onPressed: ()  {
                   
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

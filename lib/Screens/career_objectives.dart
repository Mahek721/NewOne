import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

class CareerObjectives extends StatefulWidget {
  const CareerObjectives({super.key});

  @override
  State<CareerObjectives> createState() => _CareerObjectivesState();
}

class _CareerObjectivesState extends State<CareerObjectives> {

  TextEditingController _careerObjectivesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Career Objectives",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomeTextformField(
                    maxLine: 10,
                    textInputAction: TextInputAction.go,
                    controller: _careerObjectivesController,
                    hintText: "Career Objectives",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Career Objectives is required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(text: "Complete"),
    );
  }
}
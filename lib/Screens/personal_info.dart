import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _maritalController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _languagesController = TextEditingController();
  TextEditingController _careerObjectivesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  addDataLocal() async {
    print("Starting");
    await LocalDatabase().addDataLocally(
      Email: _emailController.text,
      FullName: _nameController.text,
      MoNo: _numberController.text,
      Gender: _genderController.text,
      DOB: _dateController.text,
      MStatus: _maritalController.text,
      Languages: _languagesController.text,
      Address: _addressController.text,
      Objectives: _careerObjectivesController.text,
    );
    readDataToLocal();
    print("Completed");
  }

  readDataToLocal() async {
    final data = await LocalDatabase().readData();
    print(WholeDataList[0]['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Personal Info",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () async {
              await LocalDatabase().deleteWholeDB();
            },
            child: Icon(Icons.delete,color: blackColor,),
          ),
          SizedBox(width: 15,),
        ],
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
                    textInputAction: TextInputAction.go,
                    controller: _nameController,
                    hintText: "Full Name",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.next,
                    controller: _emailController,
                    hintText: "Email Address",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Email is required";
                      } else if(value.contains("/^[a-zA-Z0-9.!#\$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$/")) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _numberController,
                    hintText: "Mobile Number",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Number is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _genderController,
                    hintText: "Gender",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Gender is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _dateController,
                    hintText: "Date of Birth",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "DOB is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _maritalController,
                    hintText: "Marital Status",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Marital Status is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _languagesController,
                    hintText: "Languages",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Marital Status is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _addressController,
                    hintText: "Address",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Address is required";
                      }
                      return null;
                    },
                  ),
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
      bottomNavigationBar: CustomButton(
        onTap: addDataLocal,
        text: "Complete"
      ),
    );
  }
}
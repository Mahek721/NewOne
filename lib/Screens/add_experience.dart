import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/LocalDB/Experience.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

import '../Contants/style.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key});

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  addDataToLocal() async {
    await ExperienceDB().addEducationDataLocally(
      CName: _companyNameController.text,
      Role: _roleController.text,
      Month: _monthController.text,
      Desc: _descriptionController.text,
      Uid: WholeDataList[0]['id'],
    );
    readData();
  }

  readData() async {
    await ExperienceDB().readDataEducation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Experience",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () async {
              await ExperienceDB().deleteWholeDB();
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
                    controller: _companyNameController,
                    hintText: "Company Name",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Company Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.next,
                    controller: _roleController,
                    hintText: "Role",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Role is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _monthController,
                    hintText: "Experience in Month",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Experience in Month is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    maxLine: 4,
                    textInputAction: TextInputAction.go,
                    controller: _descriptionController,
                    hintText: "Description",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Description is required";
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
        onTap: addDataToLocal,
        text: "Complete"),
    );
  }
}
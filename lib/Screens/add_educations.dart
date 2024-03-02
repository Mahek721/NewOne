import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/EducationTable.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

class AddEducations extends StatefulWidget {
  const AddEducations({super.key});

  @override
  State<AddEducations> createState() => _AddEducationsState();
}

class _AddEducationsState extends State<AddEducations> {
  TextEditingController _courseController = TextEditingController();
  TextEditingController _universityNameController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _PRController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  addDataLocal() async {
    await EducationDB().addEducationDataLocally(
      Course: _courseController.text,
      UName: _universityNameController.text,
      Year: _yearController.text,
      Pr: _PRController.text,
      Desc: _descriptionController.text,
      Uid: WholeDataList[0]['id'],
    );
    readData();
  }

  readData() async {
    await EducationDB().readDataEducation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Education",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () async {
              await EducationDB().deleteWholeDB();
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
                    controller: _courseController,
                    hintText: "Course",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Course is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.next,
                    controller: _universityNameController,
                    hintText: "School/ University Name",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "School/ University Name is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _yearController,
                    hintText: "Year of Passing",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Year of Passing is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _PRController,
                    hintText: "Percentage / SGPA",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Percentage is required";
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
                        return "Percentage is required";
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
        text: "Complete"),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/LocalDB/projects.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

class AddProjects extends StatefulWidget {
  const AddProjects({super.key});

  @override
  State<AddProjects> createState() => _AddProjectsState();
}

class _AddProjectsState extends State<AddProjects> {
  TextEditingController _projectNameController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _completeMonthController = TextEditingController();
  TextEditingController _memeberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  addDataToLocal() async {
    await ProjectsDB().addEducationDataLocally(
      PName: _projectNameController.text,
      Role: _roleController.text,
      CMonth: _completeMonthController.text,
      Team: _memeberController.text,
      Desc: _descriptionController.text,
      Uid: WholeDataList[0]['id'],
    );
    readData();
  }

  readData() async {
    await ProjectsDB().readDataEducation();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Projects",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () async {
              await ProjectsDB().deleteWholeDB();
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
                    controller: _projectNameController,
                    hintText: "Project Name",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Project Name is required";
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
                    controller: _completeMonthController,
                    hintText: "Complete Project in Month",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Complete Project in Month is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomeTextformField(
                    textInputAction: TextInputAction.go,
                    controller: _memeberController,
                    hintText: "Team Member",
                    validator: (value) {
                      if(value!.isEmpty) {
                        return "Team Member is required";
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
import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/LocalDB/skills.dart';
import 'package:new_one/Widgets/custom_button.dart';
import 'package:new_one/Widgets/custome_text_box.dart';

class AddSkills extends StatefulWidget {
  const AddSkills({super.key});

  @override
  State<AddSkills> createState() => _AddSkillsState();
}

class _AddSkillsState extends State<AddSkills> {

  TextEditingController _skillController = TextEditingController();
  var skill = [];
  final _formKey = GlobalKey<FormState>();

  addDataToLocal() async {
    await SkillsDB().addEducationDataLocally(
      Skills: skill.toString(),
      Uid: WholeDataList[0]['id'],
    );
    readData();
  }

  readData() async {
    await SkillsDB().readDataEducation();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Skills",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10,),
            child: Column(
              children: [
                CustomeTextformField(
                  textInputAction: TextInputAction.go,
                  controller: _skillController,
                  hintText: "Project Name",
                  suffixIcon: InkWell(
                    onTap: () {
                      if(_skillController.text.trim() != null) {
                        setState(() {
                          skill.add(_skillController.text.trim());
                          _skillController.clear();
                        });
                      }
                    },
                    child: Icon(Icons.check)
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Project Name is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 3.0,
                      children: [
                        for(int i=0;i<skill.length;i++) 
                        Chip(
                          label: Text(skill[i]),
                          onDeleted: () {
                            setState(() {
                              skill.removeAt(i);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
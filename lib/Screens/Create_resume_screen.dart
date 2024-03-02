import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/Screens/add_educations.dart';
import 'package:new_one/Screens/add_experience.dart';
import 'package:new_one/Screens/add_projects.dart';
import 'package:new_one/Screens/add_skills.dart';
import 'package:new_one/Screens/career_objectives.dart';
import 'package:new_one/Screens/details_Screen.dart';
import 'package:new_one/Screens/personal_info.dart';
import 'package:new_one/Widgets/custom_button.dart';

class CreateResumeScreen extends StatefulWidget {
  const CreateResumeScreen({super.key});

  @override
  State<CreateResumeScreen> createState() => _CreateResumeScreenState();
}

class _CreateResumeScreenState extends State<CreateResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        title: Text("Create New Resumes",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(PersonalInfoScreen());
                },
                title: Text("Personal Details"),
                trailing: Icon(CupertinoIcons.chevron_forward),
              ),
              ListTile(
                onTap: () {
                  Get.to(AddEducations());
                },
                title: Text("Educations"),
                trailing: Icon(CupertinoIcons.chevron_forward),
              ),
              ListTile(
                onTap: () {
                  Get.to(AddExperience());
                },
                title: Text("Experience"),
                trailing: Icon(CupertinoIcons.chevron_forward),
              ),
              ListTile(
                onTap: () {
                  Get.to(AddSkills());
                },
                title: Text("Skills"),
                trailing: Icon(CupertinoIcons.chevron_forward),
              ),
              ListTile(
                onTap: () {
                  Get.to(AddProjects());
                },
                title: Text("Projects"),
                trailing: Icon(CupertinoIcons.chevron_forward),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          Get.to(DetailsScreen());
        },
        text: "Create Resume"),
    );
  }
}
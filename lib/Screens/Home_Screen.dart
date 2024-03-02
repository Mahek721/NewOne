import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/EducationTable.dart';
import 'package:new_one/LocalDB/Experience.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/LocalDB/projects.dart';
import 'package:new_one/LocalDB/skills.dart';
import 'package:new_one/Screens/Create_resume_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Resumes",style: customeTextStyle(
          color: blackColor,
          fontWeight: FontWeight.w800,
        ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () async {
              await LocalDatabase().deleteWholeDB(); 
              await EducationDB().deleteWholeDB(); 
              await ExperienceDB().deleteWholeDB(); 
              await ProjectsDB().deleteWholeDB(); 
              await SkillsDB().deleteWholeDB(); 
              Get.to(CreateResumeScreen());
            },
            child: Icon(Icons.add,color: blackColor,),
          ),
          SizedBox(width: 15,),
        ],
      ),
    );
  }
}
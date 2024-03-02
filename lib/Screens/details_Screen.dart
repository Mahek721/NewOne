import 'package:flutter/material.dart';
import 'package:new_one/Contants/const.dart';
import 'package:new_one/Contants/style.dart';
import 'package:new_one/LocalDB/EducationTable.dart';
import 'package:new_one/LocalDB/Experience.dart';
import 'package:new_one/LocalDB/LocalDB.dart';
import 'package:new_one/LocalDB/projects.dart';
import 'package:new_one/LocalDB/skills.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Resume",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: WholeDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Details",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Text("Email : " + WholeDataList[0]['Email']),
                Text("Name : " + WholeDataList[0]['FullName']),
                Text("Mobile Number : " + WholeDataList[0]['MoNo']),
                Text("Gender : " + WholeDataList[0]['Gender']),
                Text("Date of Birth : " + WholeDataList[0]['DOB']),
                Text("Marital Status : " + WholeDataList[0]['MStatus']),
                Text("Languages : " + WholeDataList[0]['Languages']),
                Text("Address : " + WholeDataList[0]['Address']),

                SizedBox(height: 20,),
                Text("Career Objectives",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Text(WholeDataList[0]['Objectives']),

                SizedBox(height: 20,),
                Text("Skills set",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Text(WholeSkillsDataList[0]['Skills'].toString().split('[')[1].split(']')[0]),
                
                SizedBox(height: 20,),
                Text("Education",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: WholeEducationDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Course Name : " + WholeEducationDataList[index]['Course']),
                          Text("University/School Name : " + WholeEducationDataList[index]['UName']),
                          Text("Year of Passing: " + WholeEducationDataList[index]['Year']),
                          Text("Percentage/SGPA : " + WholeEducationDataList[index]['Pr']),
                          Text("Description : " + WholeEducationDataList[index]['Desc']),
                          SizedBox(height: 10,),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: 20,),
                Text("Experience",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: WholeExperienceDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Comapny Name : " + WholeExperienceDataList[index]['CName']),
                          Text("Role : " + WholeExperienceDataList[index]['Role']),
                          Text("Experience in Month : " + WholeExperienceDataList[index]['Month']),
                          Text("Description : " + WholeExperienceDataList[index]['Desc']),
                          SizedBox(height: 10,),
                        ],
                      );
                    },
                  ),
                ),     

                SizedBox(height: 20,),
                Text("Projects",style: customeTextStyle(color: blackColor,fontWeight: FontWeight.w800,fontSize: 20,),),
                SizedBox(height: 10,),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: WholeProjectDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Project Name : " + WholeProjectDataList[index]['PName']),
                          Text("Role : " + WholeProjectDataList[index]['Role']),
                          Text("Project Complete in Month : " + WholeProjectDataList[index]['CMonth']),
                          Text("Team Member : " + WholeProjectDataList[index]['Team']),
                          Text("Description : " + WholeProjectDataList[index]['Desc']),
                          SizedBox(height: 10,),
                        ],
                      );
                    },
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
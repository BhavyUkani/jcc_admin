import 'dart:core';

import 'package:jcc_admin/generated/assets.dart';

class CommonDataConstants {
  static final List<String> bottomNavigation = [
    "Home",
    "Complaints",
    "Employee",
    "Notifications",
  ];

  static final List<String> complaintStatuses = [
    'Registered',
    'In Process',
    'On Hold',
    'Solved',
  ];

  static final List<String> employeeTypes = ["employee", "hod"];

  static final List<String> wardNameList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  static final List<String> departmentNameList = [
    "Water Works",
    "Slum",
    "Light eSMART CITY AREA",
    "Civil",
    "Health",
    "Solid Waste Branch",
    "Estate",
    "Town Planning",
    "UGD",
    "House Tax",
    "UCD",
    "ICDS",
    "Garden",
    "Project Planning",
    "Light EESL NAGAR SIm AREA",
    "Security",
    "FLOOD CONTROL",
  ];

  static const String home = "Home";
  static const String userProfile = "Profile";
  static const String editUserProfile = "Edit Profile";
  static const String notifications = "Notifications";
  static const String complaintDetails = "Complaint Details";

  static const String language = "Language";
  static const String aboutUs = "About us";
  static const String needAnyHelp = "Need any help?";
  static const String logOut = "Log out";
  static const String save = "Save";
}

class ComplaintStateDataConstants {
  static final List<String> complaintState = [
    "Registered",
    "On Hold",
    "In Process",
    "Solved"
  ];

  static final List<String> complaintStateStatement = [
    "Complaints Registered",
    "Complaints  Hold",
    "Complaints In Process",
    "Complaints Solved",
  ];
}

class ScreensDataConstants {
  static const String recentTitle = "Recent Complaints";
  static const String fullName = "Full Name";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String mobileNo = "Mobile No";
  static const String email = "Email";

  // Complaint Details Screens
  static const String complaintNo = "Complaint no.";
  static const String status = "Status";
  static const String registrationDate = "Registration Date";
  static const String durationOfCompletion = "Duration of Completion";
  static const String department = "Department";
  static const String subject = "Subject";
  static const String areaName = "Area Name";
  static const String wardNo = "Ward no.";
  static const String address = "Address";
  static const String description = "Description";
  static const String applicantName = "Applicant Name";
  static const String assignedEmpId = 'Assigned Employee ID';
  static const String applicantMobileNo = "Applicant Mobile no.";
  static const String remarks = "Remarks";
  static const String photographs = "Photographs";
  static const String completionCode = "Completion Code";
  static const String timeRemaining = "Time Remaining";
}

class DepartmentDataConstants {

  static final List<String> departmentNameList = [
    "Water Works",
    "Slum",
    "Light eSMART CITY AREA",
    "Civil",
    "Health",
    "Solid Waste Branch",
    "Estate",
    "Town Planning",
    "UGD",
    "House Tax",
    "UCD",
    "ICDS",
    "Garden",
    "Project Planning",
    "Light EESL NAGAR SIm AREA",
    "Security",
    "FLOOD CONTROL",
  ];

  static final List<String> departmentThumbnailIcons = [
    Assets.departmentThumbnailWater,
    Assets.departmentThumbnailSlum,
    Assets.departmentThumbnailLightEeslNagarSimArea,
    Assets.departmentThumbnailCivil,
    Assets.departmentThumbnailHealth,
    Assets.departmentThumbnailSoildWaste,
    Assets.departmentThumbnailEstate,
    Assets.departmentThumbnailTownPlanning,
    Assets.departmentThumbnailUgd,
    Assets.departmentThumbnailHouseTax,
    Assets.departmentThumbnailUcd,
    Assets.departmentThumbnailIcds,
    Assets.departmentThumbnailGarden,
    Assets.departmentThumbnailProjectPlanning,
    Assets.departmentThumbnailLightEeslNagarSimArea,
    Assets.departmentThumbnailSecurity,
    Assets.departmentThumbnailFloodControl,
  ];


  static final List<String> departmentIconsAssetsName = [
    Assets.departmentIconsWaterDepartment,
    Assets.departmentIconsSlumDepartment,
    Assets.departmentIconsLightEesl,
    Assets.departmentIconsCivil,
    Assets.departmentIconsHealth,
    Assets.departmentIconsSolidWaste,
    Assets.departmentIconsEstate,
    Assets.departmentIconsTownPlanning,
    Assets.departmentIconsUndergroundSewers,
    Assets.departmentIconsHouseTax,
    Assets.departmentIconsUcd,
    Assets.departmentIconsIcds,
    Assets.departmentIconsGarden,
    Assets.departmentIconsProjectPlanning,
    Assets.departmentIconsESmartLight,
    Assets.departmentIconsSecurity,
    Assets.departmentIconsFloodControl,
  ];

  static final List<String> listOfToken = [
    // "d1WTu4ojS_CpPj0UHt8wG5:APA91bHgQvMhFq-P1GmTsXx0rLNcn5qds8IkTbYwkvSxF0miqY7tOei_myym9o5-1HxiYFnkOwsDb54sd2pWBBnRvjRkZ45iUiEThNuhJ14cCtlQHlzEtH6IpeJKoe-E2TjEiOxzZhbJ",
    // "dfQN7MjiS-CGE1jPcUWe1R:APA91bEpsVJhNLBq4D3hEQE0GYyHqsNX8BdeUVAk8TQPM-KVSPyu4WCXV85d8PhPeEiu4VB2-NBNSo_jrZiaXlrtwGNOnk_KGoLXWTxn1jrQAsGy8vqq5NKacwVeAD1gAqg8ENOD_3iJ",
    // "cnbSy87hS8Ok9uQ9OgPdjp:APA91bGgKkgEnEQlQpzChhjr6KWb0xWxU4T6iQxHiA7eKQ7nSbSn4QjCE-TgQ_KGrVSftE1tvBurJL0f2vXhO34DOFa2mEJIFPlTYeU51X6cXZVhVGThvWnarDs0tbPJWa00sOwcGdRa",
    // "fGCEAr7jSZy_MB-4f0whkI:APA91bEniBfPdyZ_lCUHo1jyaF5CGMraRdhSBcxXxF8D8mtxJEpNsZYhweyvTXNnG7PXBKRhWYeYYFairru87aZfa1KOUbfLhhoWBVZAb2VWeRtBduhJ_zxNm_T4ndB_d1aZKy1Eaj2K",
    // "175f1eb0-24bf-4bdb-afc1-72454f8eb85a",
    "+918160639228",
  ];
}




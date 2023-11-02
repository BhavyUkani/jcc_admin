import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ComplaintModel extends Equatable {
  final String id;
  final String description;
  final DateTime registrationDate;
  final String departmentName;
  final String subject;
  final String ward;
  final String area;
  final String detailedAddress;
  final String userId;
  final String uniquePin;
  final List<String> imageUrls;
  final String status;
  final bool isLocked;
  final bool isAssigned;
  final String assignedEmployeeId;
  final String applicantName;

  @override
  List<Object?> get props => [
    id,
    description,
    registrationDate,
    departmentName,
    subject,
    ward,
    area,
    userId,
    uniquePin,
    imageUrls,
    status,
    detailedAddress,
    isLocked,
    isAssigned,
    assignedEmployeeId,
    applicantName,
  ];

//<editor-fold desc="Data Methods">
  const ComplaintModel({
    required this.id,
    required this.description,
    required this.registrationDate,
    required this.departmentName,
    required this.subject,
    required this.ward,
    required this.area,
    required this.userId,
    required this.uniquePin,
    required this.imageUrls,
    required this.status,
    required this.detailedAddress,
    required this.isLocked,
    required this.isAssigned,
    required this.assignedEmployeeId,
    required this.applicantName,
  });

  @override
  String toString() {
    return 'ComplaintModel{ id: $id, description: $description, registrationDate: $registrationDate, departmentName: $departmentName, subject: $subject, ward: $ward, area: $area, userId: $userId, uniquePin: $uniquePin, imageUrls: $imageUrls, status: $status, siteAddress: $detailedAddress, isLocked: $isLocked, isAssigned: $isAssigned, assignedId: $assignedEmployeeId,}';
  }

  ComplaintModel copyWith({
    String? id,
    String? description,
    DateTime? registrationDate,
    String? departmentName,
    String? subject,
    String? ward,
    String? area,
    String? userId,
    String? uniquePin,
    List<String>? imageUrls,
    String? status,
    String? siteAddress,
    bool? isLocked,
    bool? isAssigned,
    String? assignedId,
    String? applicantName,
  }) {
    return ComplaintModel(
      id: id ?? this.id,
      description: description ?? this.description,
      registrationDate: registrationDate ?? this.registrationDate,
      departmentName: departmentName ?? this.departmentName,
      subject: subject ?? this.subject,
      ward: ward ?? this.ward,
      area: area ?? this.area,
      userId: userId ?? this.userId,
      uniquePin: uniquePin ?? this.uniquePin,
      imageUrls: imageUrls ?? this.imageUrls,
      status: status ?? this.status,
      detailedAddress: siteAddress ?? detailedAddress,
      isLocked: isLocked ?? this.isLocked,
      isAssigned: isAssigned ?? this.isAssigned,
      assignedEmployeeId: assignedId ?? assignedEmployeeId,
      applicantName: applicantName ?? this.applicantName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'registrationDate': registrationDate,
      'departmentName': departmentName,
      'subject': subject,
      'ward': ward,
      'area': area,
      'userId': userId,
      'uniquePin': uniquePin,
      'imageUrls': imageUrls,
      'status': status,
      'siteAddress': detailedAddress,
      'isLocked': isLocked,
      'isAssigned': isAssigned,
      'assignedId': assignedEmployeeId,
      'applicantName' : applicantName,
    };
  }

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    final date =  (map['registrationDate'] as Timestamp).toDate();
    return ComplaintModel(
      id: map['id'] as String,
      description: map['description'] as String,
      registrationDate: date,
      departmentName: map['departmentName'] as String,
      subject: map['subject'] as String,
      ward: map['ward'] as String,
      area: map['area'] as String,
      userId: map['userId'] as String,
      uniquePin: map['uniquePin'] as String,
      imageUrls:( map['imageUrls'] as List<dynamic>).map((e) => e.toString()).toList(),
      status: map['status'] as String,
      detailedAddress: map['siteAddress'] as String,
      isLocked: map['isLocked'] as bool,
      isAssigned: map['isAssigned'] as bool,
      assignedEmployeeId: map['assignedId'] as String,
      applicantName: map['applicantName'] as String,
    );
  }
}
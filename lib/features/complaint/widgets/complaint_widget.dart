import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../constants/app_color.dart';
import '../../../model/complaint_model.dart';
import '../../../utils/ui_utils.dart';

class ComplaintWidget extends StatelessWidget {
  final ComplaintModel complaint;

  const ComplaintWidget({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/complaints/complaint_details');
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.antiFlashWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            Image.asset(
              UIUtils.getIconName(complaint.departmentName),
              height: 60,
              width: 60,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UIUtils.formatDate(complaint.registrationDate),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  complaint.departmentName,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  complaint.subject,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                buildStatus(
                  context,
                  AppColors.monaLisa,
                  complaint.status,
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Complaint no. ',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: complaint.id,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildStatus(BuildContext context, Color color, String status) {
    return Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          status,
          style: const TextStyle(
              fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w100),
        )
      ],
    );
  }

}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jcc_admin/bloc/login/login_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../bloc/notifications/notification_bloc.dart';
import '../../../common/widget/menu_drawer.dart';
import '../../../common/widget/primary_button.dart';
import '../../../constants/app_color.dart';
import '../../../constants/string_constants.dart';
import '../../../generated/assets.dart';
import '../../../model/notification_model.dart';
import '../../../utils/conversion.dart';
import '../../../utils/ui_utils.dart';

import '../../../common/widget/scroll_to_hide_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> list = [];

    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Notification');
            if (widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.hide();
            }
          } else {
            dev.log('State is null', name: 'Notification');
          }
        } else {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Notification');
            if (!widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.show();
            }
          } else {
            dev.log('State is null', name: 'Notification');
          }
        }
      },
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                Assets.iconsMenu,
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          CommonDataConstants.notifications,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 22,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (widget.bottomNavKey.currentState != null) {
                dev.log('State is not null', name: 'Notification');
                if (widget.bottomNavKey.currentState!.isVisible) {
                  widget.bottomNavKey.currentState!.hide();
                }
              } else {
                dev.log('State is null', name: 'Notification');
              }
              var bottomSheetController = showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _buildBottomSheet(context, list);
                },
              );
              bottomSheetController.whenComplete(() {
                if (widget.bottomNavKey.currentState != null) {
                  dev.log('State is not null', name: 'Notification');
                  if (!widget.bottomNavKey.currentState!.isVisible) {
                    widget.bottomNavKey.currentState!.show();
                  }
                } else {
                  dev.log('State is null', name: 'Notification');
                }
              });
            },
            icon: SvgPicture.asset(Assets.iconsFilter),
          ),
        ],
      ),
      // body: ListView.separated(
      //   controller: widget.controller,
      //   padding: const EdgeInsets.all(10),
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return _buildNotificationItem(
      //       notification: NotificationModel(
      //           timeStamp: DateTime.now(),
      //           departmentName: 'Health',
      //           description: 'New complaint is registered    ',
      //           complaintId: '45',
      //           userId: '916355303321'),
      //       context: context,
      //     );
      //   },
      //   separatorBuilder: (context, index) => const SizedBox(
      //     height: 5,
      //   ),
      // ),
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NotificationLoading || state is NotificationInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            list = state.notificationList;
            if (list.isEmpty) {
              return Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Lottie.asset(
                    Assets.lottieSearch,
                    repeat: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nothing to Show',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              );
            } else {
              var notifications = state.notificationList;
              final employee = (context.read<LoginBloc>().state as LoggedIn).employee;
              if (employee.type == 'employee') {
                notifications = notifications.where((notification) => notification.ward == employee.ward).toList();
              }

              return ListView.separated(
                controller: widget.controller,
                padding: const EdgeInsets.all(10),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return _buildNotificationItem(
                    notification: notifications[index],
                    context: context,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
              );
            }
          } else if (state is NotificationError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, List<NotificationModel> list) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(
        minWidth: 400,
      ),
      child: ListView(
        children: [
          Text(
            "Sort",
            style: GoogleFonts.robotoCondensed(fontSize: 14),
          ),
          DropdownButtonFormField(
            padding: const EdgeInsets.only(left: 15),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            hint: Text(
              "Sort By",
            ),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Newest",
                ),
                value: "Newest",
              ),
              DropdownMenuItem(
                child: Text("Oldest"),
                value: "Oldest",
              ),
            ],
            onChanged: (value) {
              // values = value!;
            },
          ),
          SizedBox(height: 20),
          PrimaryButton(
              onTap: () {},
              // onTap: () {
              //   if (values == "Newest") {
              //     context
              //         .read<NotificationBloc>()
              //         .add(UpdateNotification(list.toList()));
              //   } else if (values == 'Oldest') {
              //     context
              //         .read<NotificationBloc>()
              //         .add(UpdateNotification(list.reversed.toList()));
              //   }
              //   list = list.reversed.toList();
              //   Navigator.pop(context);
              //
              //   // context.read<NotificationBloc>().add(ToggleOrderOfNotification());
              // },
              title: "Apply Filters"),
        ],
      ),
    );
  }
}

Widget _buildNotificationItem({
  required NotificationModel notification,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.antiBlueFlash,
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    padding: const EdgeInsets.only(left: 5, right: 15.5, top: 15, bottom: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          UIUtils.getIconName(
            notification.departmentName,
          ),
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 101,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.departmentName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                // overflow: TextOverflow.ellipsis,
                notification.description,
                style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    Conversion.formatDateTime(notification.timeStamp),
                    style: TextStyle(
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

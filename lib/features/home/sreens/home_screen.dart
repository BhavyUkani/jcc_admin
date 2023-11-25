import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jcc_admin/bloc/complaint/recent_complaints/recent_complaints_bloc.dart';

import 'dart:developer' as dev;
import '../../../bloc/complaint/stats/complaint_stats_bloc.dart';
import '../../../common/widget/menu_drawer.dart';
import '../../../common/widget/scroll_to_hide_widget.dart';

// import '../../../config/router.dart';
import '../../../constants/app_color.dart';
import '../../../constants/string_constants.dart';
import '../../../generated/assets.dart';
import '../widget/data_card.dart';
import '../widget/data_chart.dart';
import '../widget/recent_complaints_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.controller,
    required this.bottomNavKey,
  });

  final ScrollController controller;
  final GlobalKey<ScrollToHideWidgetState> bottomNavKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const MenuDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Home');
            if (widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.hide();
            }
          } else {
            dev.log('State is null', name: 'Home');
          }
        } else {
          if (widget.bottomNavKey.currentState != null) {
            dev.log('State is not null', name: 'Home');
            if (!widget.bottomNavKey.currentState!.isVisible) {
              widget.bottomNavKey.currentState!.show();
            }
          } else {
            dev.log('State is null', name: 'Home');
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
          CommonDataConstants.home,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 22,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.iconsSearch),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: widget.controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ComplaintStatsBloc, ComplaintStatsState>(
              builder: (context, state) {
                if (state is ComplaintStatsLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ComplaintStatsError) {
                  return Text(state.message);
                } else if (state is ComplaintStatsLoaded) {
                  final data = state.stats;

                  List<ComplaintStateData> complaintStateData = [
                    ComplaintStateData(
                      ComplaintStateDataConstants.complaintState[0],
                      data.registered.toString(),
                      (data.registered / data.total) * 100,
                      AppColors.brightTurquoise,
                    ),
                    ComplaintStateData(
                      ComplaintStateDataConstants.complaintState[1],
                      data.onHold.toString(),
                      (data.onHold / data.total) * 100,
                      AppColors.monaLisa,
                    ),
                    ComplaintStateData(
                      ComplaintStateDataConstants.complaintState[2],
                      data.inProcess.toString(),
                      (data.inProcess / data.total) * 100,
                      AppColors.heliotrope,
                    ),
                    ComplaintStateData(
                      ComplaintStateDataConstants.complaintState[3],
                      data.solved.toString(),
                      (data.solved / data.total) * 100,
                      AppColors.mantis,
                    ),
                  ];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            DataCard(
                              index: 0,
                              complaintStateData: complaintStateData[0],
                            ),
                            DataCard(
                              index: 1,
                              complaintStateData: complaintStateData[1],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DataCard(
                              index: 2,
                              complaintStateData: complaintStateData[2],
                            ),
                            DataCard(
                              index: 3,
                              complaintStateData: complaintStateData[3],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          child: Container(
                            height: 360,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: AppColors.platinum,
                            ),
                            child: Center(
                              child: DataChart(
                                complaintStateData: complaintStateData,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Text('Unknown state');
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                ScreensDataConstants.recentTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            BlocBuilder<RecentComplaintsBloc, RecentComplaintsState>(
              builder: (context, state) {
                if (state is RecentComplaintsLoading || state is RecentComplaintsInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else if (state is RecentComplaintsError) {
                  return Center(
                    child: Text('Got error: ${state.message}'),
                  );
                }else if (state is RecentComplaintsLoaded) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.hardEdge,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.complaints.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemBuilder: (context, index) {
                        return RecentComplaintsCard(complaint: state.complaints[index],);
                      },
                    ),
                  );
                }else {
                  return const Center(
                    child: Text('Unknown State'),
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ComplaintStateData {
  ComplaintStateData(
    this.complaintState,
    this.complaintDataInNumber,
    this.complaintsDataInPercentage,
    this.color,
  );

  final String complaintState;
  final String complaintDataInNumber;
  final double complaintsDataInPercentage;
  final Color color;
}

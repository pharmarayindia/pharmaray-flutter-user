import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaray/lib.dart';

class ReminderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => SizedBox(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(1),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight20,
                Padding(
                  padding: Dimens.edgeInsets20_40_20_0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.reminder,
                        style: Styles.black20w700,
                      ),
                      InkWell(
                        onTap: RouteManagement.goToAddReminder,
                        child: Text(
                          '+ ${StringConstants.add}',
                          style: Styles.primary14Bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(.83),
                  child: (_controller.remindersListResponse == null ||
                          _controller.remindersListResponse!.data == null ||
                          _controller.remindersListResponse!.data!.isEmpty)
                      ? Center(
                          child: Lottie.asset(AssetConstants.empty,
                              width: Dimens.percentWidth(.6)),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: Dimens.edgeInsets0,
                          itemCount:
                              _controller.remindersListResponse?.data?.length,
                          itemBuilder: (context, index) => Slidable(
                            endActionPane: const ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                // SlidableAction(
                                //   onPressed: (BuildContext context) {
                                //
                                //   },
                                //   backgroundColor: Colors.red,
                                //   foregroundColor: Colors.white,
                                //   icon: Icons.delete_outline,
                                //   label: StringConstants.delete,
                                // ),
                              ],
                            ),
                            child: Padding(
                              padding: Dimens.edgeInsets0_10_0_0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                    height: 1,
                                    thickness: 2,
                                  ),
                                  Padding(
                                    padding: Dimens.edgeInsets20_10_20_10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Dimens.percentWidth(.3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${DateFormat('hh:mm a').format(DateTime.parse('${_controller.remindersListResponse?.data?[index].reminderTime}'))}',
                                                style: Styles.black20w700,
                                              ),
                                              Text(
                                                '${_controller.remindersListResponse?.data?[index].reminderName}',
                                                style: Styles.black14,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimens.percentWidth(.5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                num.parse('${_controller.remindersListResponse?.data?[index].reminderTime}'
                                                            .substring(
                                                                11, 13)) <
                                                        12
                                                    ? 'Morning'
                                                    : num.parse('${_controller.remindersListResponse?.data?[index].reminderTime}'
                                                                .substring(
                                                                    11, 13)) <
                                                            16
                                                        ? 'Afternoon'
                                                        : num.parse('${_controller.remindersListResponse?.data?[index].reminderTime}'
                                                                    .substring(
                                                                        11,
                                                                        13)) <
                                                                20
                                                            ? 'Evening'
                                                            : 'Night',
                                                style: Styles.grey14Medium,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${_controller.remindersListResponse?.data?[index].noOfTablets} tablets',
                                                    style: Styles.black14,
                                                  ),
                                                  Dimens.boxWidth10,
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimens.sixty,
                                                      ),
                                                      color:
                                                          '${_controller.remindersListResponse?.data?[index].beforeMeal}' ==
                                                                  'true'
                                                              ? const Color(
                                                                  0xffffcd2a)
                                                              : const Color(
                                                                  0xff5BD2E1),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding: Dimens
                                                              .edgeInsets5_0_5_0,
                                                          child: Text(
                                                            '${_controller.remindersListResponse?.data?[index].beforeMeal}' ==
                                                                    'true'
                                                                ? 'Before meal'
                                                                : 'After meal',
                                                            style:
                                                                Styles.black12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _controller.deleteReminder(
                                                loading: true,
                                                reminderId: _controller
                                                    .remindersListResponse
                                                    ?.data?[index]
                                                    .id);
                                          },
                                          child: Image.asset(
                                            AssetConstants.delete,
                                            width: Dimens.fifteen,
                                            height: Dimens.fifteen,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    thickness: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}

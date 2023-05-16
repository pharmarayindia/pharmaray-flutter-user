import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharmaray/lib.dart';

class AddReminderView extends StatefulWidget {
  @override
  State<AddReminderView> createState() => _AddReminderViewState();
}

class _AddReminderViewState extends State<AddReminderView> {
  var medicineNameTextEditingController = TextEditingController();
  var numberOfMedicineTextEditingController = TextEditingController();

  // var durationTextEditingController = TextEditingController();
  var labelTextEditingController = TextEditingController();
  bool? beforeMeal;
  bool shouldShow = false;

  List<String> mealsList = ['Before meal', 'After meal'];
  int selectedMeal = -1;
  List<String> days = [
    '1 day',
    '2 days',
    '5 days',
    '7 days',
    '10 days',
  ];
  int selectedDay = -1;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.newReminder,
          ),
          preferredSize: Size(
            Dimens.percentWidth(1),
            Dimens.fifty,
          ),
        ),
        body: GetBuilder<AddReminderController>(
          builder: (_controller) => SizedBox(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Dimens.edgeInsets20_10_20_10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.medicine,
                          style: Styles.primary18,
                        ),
                        Text(
                          StringConstants.nameOfMedicine,
                          style: Styles.grey12Regular,
                        ),
                        Dimens.boxHeight10,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyLight),
                            borderRadius: BorderRadius.circular(Dimens.ten),
                          ),
                          child: FormFieldWidget(
                            contentPadding: Dimens.edgeInsets18,
                            hintText:
                                medicineNameTextEditingController.text.isEmpty
                                    ? 'eg; Paracetamol'
                                    : null,
                            hintStyle: Styles.grey18Regular,
                            textEditingController:
                                medicineNameTextEditingController,
                            onChange: (val) {
                              _controller.update();
                            },
                          ),
                        ),
                        Dimens.boxHeight20,
                        SizedBox(
                          width: Dimens.percentWidth(1),
                          height: Dimens.thirty,
                          child: ListView.builder(
                            itemCount: mealsList.length,
                            shrinkWrap: true,
                            padding: Dimens.edgeInsets0,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: Dimens.edgeInsets0_0_10_0,
                              child: SizedBox(
                                width: Dimens.percentWidth(.6),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Dimens.twenty,
                                      height: Dimens.twenty,
                                      child: Radio(
                                        value: index,
                                        activeColor: AppColors.primaryColor,
                                        groupValue: selectedMeal,
                                        onChanged: (value) {
                                          selectedMeal = index;
                                          if (index == 0) {
                                            beforeMeal = true;
                                          } else {
                                            beforeMeal = false;
                                          }
                                          _controller.update();
                                        },
                                      ),
                                    ),
                                    Dimens.boxWidth5,
                                    Text(
                                      mealsList[index],
                                      style: selectedMeal == index
                                          ? Styles.boldBlack14w700
                                          : Styles.grey14Medium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Dimens.boxHeight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.numberOfTabletsTaken,
                              style: Styles.grey14Medium,
                            ),
                            Container(
                              width: Dimens.ninety,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.eight),
                                border: Border.all(color: AppColors.greyLight),
                              ),
                              child: FormFieldWidget(
                                contentPadding: Dimens.edgeInsets15_18_0_18,
                                hintText: numberOfMedicineTextEditingController
                                        .text.isEmpty
                                    ? '--'
                                    : null,
                                textInputType: TextInputType.number,
                                hintStyle: Styles.boldBlack16W700,
                                textEditingController:
                                    numberOfMedicineTextEditingController,
                                onChange: (val) {
                                  _controller.update();
                                },
                              ),
                            ),
                          ],
                        ),
                        // Dimens.boxHeight10,
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       StringConstants.numberOfTabletsTaken,
                        //       style: Styles.grey14Medium,
                        //     ),
                        //     Container(
                        //       width: Dimens.percentWidth(.3),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(Dimens.ten),
                        //         border: Border.all(color: AppColors.greyLight),
                        //       ),
                        //       child: FormFieldWidget(
                        //         contentPadding: Dimens.edgeInsets18,
                        //         hintText: textEditingController.text.isEmpty
                        //             ? '--'
                        //             : null,
                        //         textInputType: TextInputType.number,
                        //         hintStyle: Styles.boldBlack16W700,
                        //         textEditingController: textEditingController,
                        //         onChange: (val) {
                        //           _controller.update();
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  Dimens.boxHeight10,
                  const Divider(
                    height: 2,
                    thickness: 5,
                    color: AppColors.storeColor1,
                  ),
                  Padding(
                    padding: Dimens.edgeInsets20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.durationOfDose,
                          style: Styles.boldBlack16W700,
                        ),
                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.begins,
                                  style: Styles.grey12Regular,
                                ),
                                Dimens.boxHeight5,
                                InkWell(
                                  onTap: () async {
                                    final picked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100, 8));
                                    if (picked != null &&
                                        picked != DateTime.now()) {
                                      _controller.startDate =
                                          DateFormat('dd / MM / yyyy')
                                              .format(picked);
                                      _controller.startDateToSend =
                                          '${picked.toIso8601String().toString()}Z';
                                      if (_controller.endDate !=
                                          'dd / mm / yyyy') {
                                        _controller.differenceInDays();
                                      }
                                    }
                                    _controller.update();
                                  },
                                  child: Container(
                                    width: Dimens.percentWidth(.35),
                                    height: Dimens.fifty,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.ten),
                                      border: Border.all(
                                        color: AppColors.greyLight,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AssetConstants.calendar,
                                          width: Dimens.fifteen,
                                          height: Dimens.fifteen,
                                        ),
                                        Dimens.boxWidth5,
                                        Text(
                                          '|',
                                          style: Styles.lightGrey14,
                                        ),
                                        Dimens.boxWidth5,
                                        Text(
                                          _controller.startDate,
                                          style: Styles.lightGrey14,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: Dimens.edgeInsets0_15_0_0,
                              child: Text(
                                '-',
                                style: Styles.boldBlack16,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.ends,
                                  style: Styles.grey12Regular,
                                ),
                                Dimens.boxHeight5,
                                InkWell(
                                  onTap: () async {
                                    final picked = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2100, 8));
                                    if (picked != null &&
                                        picked != DateTime.now()) {
                                      _controller.endDate =
                                          DateFormat('dd / MM / yyyy')
                                              .format(picked);
                                      _controller.endDateToSend =
                                          '${picked.toIso8601String().toString()}Z';
                                      if (_controller.startDate !=
                                          'dd / mm / yyyy') {
                                        _controller.differenceInDays();
                                      }
                                    }
                                    _controller.update();
                                  },
                                  child: Container(
                                    width: Dimens.percentWidth(.35),
                                    height: Dimens.fifty,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.ten),
                                      border: Border.all(
                                        color: AppColors.greyLight,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AssetConstants.calendar,
                                          width: Dimens.fifteen,
                                          height: Dimens.fifteen,
                                        ),
                                        Dimens.boxWidth5,
                                        Text(
                                          '|',
                                          style: Styles.lightGrey14,
                                        ),
                                        Dimens.boxWidth5,
                                        Text(
                                          _controller.endDate,
                                          style: Styles.lightGrey14,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // Dimens.boxHeight10,
                        // SizedBox(
                        //   width: Dimens.percentWidth(1),
                        //   height: Dimens.thirty,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     padding: Dimens.edgeInsets0,
                        //     itemCount: days.length,
                        //     itemBuilder: (context, index) => Padding(
                        //       padding: Dimens.edgeInsets0_0_5_0,
                        //       child: InkWell(
                        //         onTap: () {
                        //           selectedDay = index;
                        //           _controller.update();
                        //         },
                        //         child: Container(
                        //           height: Dimens.twenty,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(
                        //               Dimens.sixty,
                        //             ),
                        //             color: selectedDay == index
                        //                 ? AppColors.primaryColor
                        //                 : Colors.white,
                        //             border: Border.all(
                        //               color: AppColors
                        //                   .reminderContainerBorderColor,
                        //             ),
                        //           ),
                        //           child: Padding(
                        //             padding: Dimens.edgeInsets10_5_10_5,
                        //             child: Text(
                        //               days[index],
                        //               style: selectedDay == index
                        //                   ? Styles.whiteLight14
                        //                   : Styles.pathology14Light,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Dimens.boxHeight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.durationInDays,
                              style: Styles.grey14Medium,
                            ),
                            Container(
                              width: Dimens.fourtyFive,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.eight),
                                border: Border.all(color: AppColors.greyLight),
                              ),
                              child: FormFieldWidget(
                                contentPadding: Dimens.edgeInsets15_18_0_18,
                                hintText: _controller.diff,
                                textInputType: TextInputType.number,
                                hintStyle: Styles.boldBlack16W700,
                                onChange: (val) {
                                  _controller.update();
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 5,
                    color: AppColors.storeColor1,
                  ),
                  Dimens.boxHeight20,
                  Padding(
                    padding: Dimens.edgeInsets20_0_20_0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.notificationSettings,
                              style: Styles.boldBlack16W700,
                            ),
                            InkWell(
                              onTap: () {
                                if (_controller.startDate != 'Add date' &&
                                    _controller.endDate != 'Add date') {
                                  Get.bottomSheet<dynamic>(
                                      StatefulBuilder(
                                        builder: (BuildContext context,
                                                StateSetter setState) =>
                                            Container(
                                          width: Dimens.percentWidth(1),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(
                                                  Dimens.twenty),
                                              topLeft: Radius.circular(
                                                  Dimens.twenty),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: Dimens.edgeInsets10_0_10_0,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: Dimens.edgeInsets20,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        StringConstants
                                                            .setReminder,
                                                        style: Styles.black16,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          if (_controller.startDateToSend != 'Add date' &&
                                                              _controller
                                                                      .endDateToSend !=
                                                                  'Add date' &&
                                                              labelTextEditingController
                                                                  .text
                                                                  .isNotEmpty) {
                                                            shouldShow = true;
                                                            _controller
                                                                .update();
                                                            setState(() {});
                                                            Get.back<dynamic>();
                                                          }
                                                        },
                                                        child: Text(
                                                          StringConstants.save,
                                                          style:
                                                              Styles.darkBlue16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimens.percentWidth(1),
                                                  height:
                                                      Dimens.percentHeight(.25),
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .time,
                                                    onDateTimeChanged:
                                                        (DateTime value) {
                                                      var b = _controller
                                                          .startDateToSend
                                                          .substring(0, 11);
                                                      var c = _controller
                                                          .endDateToSend
                                                          .substring(0, 11);
                                                      // print(b);
                                                      // print(c);
                                                      var tempDate = DateFormat(
                                                              'HH:mm')
                                                          .parse(
                                                              '${value.hour}:${value.minute}');
                                                      var add = tempDate
                                                          .toString()
                                                          .substring(11, 16);
                                                      _controller
                                                              .startDateToSend =
                                                          '$b$add:00.000Z';
                                                      _controller
                                                              .endDateToSend =
                                                          '$c$add:00.000Z';
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                                Dimens.boxHeight10,
                                                Text(
                                                  StringConstants.label,
                                                  style: Styles.grey12Regular,
                                                ),
                                                Dimens.boxHeight10,
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .greyLight),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimens.ten),
                                                  ),
                                                  child: FormFieldWidget(
                                                    contentPadding:
                                                        Dimens.edgeInsets18,
                                                    textInputType:
                                                        TextInputType.text,
                                                    hintText:
                                                        labelTextEditingController
                                                                .text.isEmpty
                                                            ? 'Type here'
                                                            : null,
                                                    hintStyle:
                                                        Styles.grey18Regular,
                                                    textEditingController:
                                                        labelTextEditingController,
                                                    onChange: (val) {
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                                Dimens.boxHeight20,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      isScrollControlled: true);
                                }
                              },
                              child: Text(
                                '+ ${StringConstants.add}',
                                style: Styles.primary16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          StringConstants.setReminderTimings,
                          style: Styles.grey12,
                        ),
                      ],
                    ),
                  ),
                  Dimens.boxHeight20,
                  shouldShow
                      ? Padding(
                          padding: Dimens.edgeInsets20_0_20_0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${DateFormat('hh:mm a').format(DateTime.parse('${_controller.startDateToSend}'))}',
                                style: Styles.boldBlack14w700,
                              ),
                              Text(
                                num.parse('${_controller.startDateToSend}'
                                            .substring(11, 13)) <
                                        12
                                    ? 'Morning'
                                    : num.parse('${_controller.startDateToSend}'
                                                .substring(11, 13)) <
                                            16
                                        ? 'Afternoon'
                                        : num.parse('${_controller.startDateToSend}'
                                                    .substring(11, 13)) <
                                                20
                                            ? 'Evening'
                                            : 'Night',
                                style: Styles.boldBlack16W700,
                              ),
                            ],
                          ),
                        )
                      : Dimens.box0,
                  Dimens.boxHeight20,
                  SafeArea(
                    child: Padding(
                      padding: Dimens.edgeInsets20_0_20_0,
                      child: InkWell(
                        onTap: ()async {
                          if (medicineNameTextEditingController
                                  .text.isNotEmpty &&
                              selectedMeal != -1 &&
                              numberOfMedicineTextEditingController
                                  .text.isNotEmpty &&
                              beforeMeal != null &&
                              _controller.startDate != 'Add date' &&
                              _controller.endDate != 'Add date' &&
                              labelTextEditingController.text.isNotEmpty) {
                            await _controller.addReminder(
                                loading: true,
                                reminderName:
                                    medicineNameTextEditingController.text,
                                startDate: _controller.startDateToSend,
                                endDate: _controller.endDateToSend,
                                beforeMeal: beforeMeal!,
                                numberOfTablets: num.parse(
                                    numberOfMedicineTextEditingController.text),
                                reminderTime: _controller.startDateToSend,
                                reminderLabel: labelTextEditingController.text);
                          }
                        },
                        child: Container(
                          width: Dimens.percentWidth(1),
                          height: Dimens.fifty,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimens.five,
                            ),
                            color: AppColors.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                StringConstants.save,
                                style: Styles.whiteLight16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxHeight20,
                ],
              ),
            ),
          ),
        ),
      );
}

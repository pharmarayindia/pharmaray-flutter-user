import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class UploadPrescriptionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.uploadPrescription1,
          ),
          preferredSize: Size(
            Dimens.percentWidth(1),
            Dimens.fifty,
          ),
        ),
        body: GetBuilder<UploadPrescriptionController>(
          builder: (_controller) => Padding(
            padding: Dimens.edgeInsets20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _controller.getCameraImage();
                      },
                      child: Container(
                        width: Dimens.percentWidth(.42),
                        height: Dimens.fifty,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.five),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetConstants.camera,
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.camera,
                              style: Styles.primary14Bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _controller.getGalleryImage();
                      },
                      child: Container(
                        width: Dimens.percentWidth(.42),
                        height: Dimens.fifty,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.five),
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetConstants.gallery,
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.gallery,
                              style: Styles.primary14Bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight15,
                InkWell(
                  onTap: RouteManagement.goToHowToUpload,
                  child: Container(
                    width: Dimens.percentWidth(.9),
                    height: Dimens.fourty,
                    decoration: BoxDecoration(
                      color: AppColors.medicineDetailContainerColor,
                      borderRadius: BorderRadius.circular(Dimens.five),
                      border: Border.all(color: AppColors.uploadColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Dimens.boxWidth10,
                            Image.asset(
                              AssetConstants.toDoList,
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                            ),
                            Dimens.boxWidth10,
                            Text(
                              StringConstants.howToUpload,
                              style: Styles.primary14BoldDarkColor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AssetConstants.next,
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                            ),
                            Dimens.boxWidth10,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstants.allPrescriptions,
                      style: Styles.boldBlack16,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.isSelectionAvailable =
                                !_controller.isSelectionAvailable;
                            _controller.update();
                          },
                          child: Text(
                            _controller.isSelectionAvailable
                                ? StringConstants.cancel
                                : StringConstants.select,
                            style: Styles.black14,
                          ),
                        ),
                        Dimens.boxWidth10,
                        SizedBox(
                          width: Dimens.twentyFour,
                          height: Dimens.twentyFour,
                          child: PopupMenuButton<dynamic>(
                            iconSize: Dimens.twentyFour,
                            offset: const Offset(-10, 30),
                            itemBuilder: (context) => [
                              PopupMenuItem<dynamic>(
                                onTap: () async {
                                  if (_controller.isSelectionAvailable &&
                                      _controller.selectedIndexes.isNotEmpty) {
                                    await Future<dynamic>.delayed(
                                      const Duration(milliseconds: 300),
                                    ).then<dynamic>(
                                      (dynamic value) => Get.dialog<dynamic>(
                                        Material(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              Dimens.twenty,
                                              Dimens.percentHeight(.38),
                                              Dimens.twenty,
                                              Dimens.percentHeight(.38),
                                            ),
                                            child: Container(
                                              width: Dimens.percentWidth(.8),
                                              height: Dimens.percentHeight(.2),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimens.twenty),
                                              ),
                                              child: Padding(
                                                padding: Dimens.edgeInsets20,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          StringConstants
                                                              .deletePrescription,
                                                          style: Styles.red16,
                                                        ),
                                                        Dimens.boxHeight5,
                                                        Text(
                                                          StringConstants
                                                              .willBeDeleted,
                                                          style: Styles.black14,
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back<dynamic>();
                                                            for (var i = 0;
                                                                i <
                                                                    _controller
                                                                        .selectedIndexes
                                                                        .length;
                                                                i++) {
                                                              _controller
                                                                  .selectedIndexes
                                                                  .removeAt(i);
                                                              _controller
                                                                  .selectedPrescriptions
                                                                  .removeAt(i);
                                                              _controller
                                                                      .isSelectionAvailable =
                                                                  false;
                                                            }
                                                            _controller
                                                                .update();
                                                          },
                                                          child: Container(
                                                            width: Dimens
                                                                .percentWidth(
                                                                    .35),
                                                            height:
                                                                Dimens.thirty,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          Dimens
                                                                              .eight),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  StringConstants
                                                                      .yes,
                                                                  style: Styles
                                                                      .red14,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: Get.back,
                                                          child: Container(
                                                            width: Dimens
                                                                .percentWidth(
                                                                    .35),
                                                            height:
                                                                Dimens.thirty,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(Dimens
                                                                            .eight),
                                                                color: AppColors
                                                                    .storeBorderColor),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  StringConstants
                                                                      .cancel,
                                                                  style: Styles
                                                                      .black14,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AssetConstants.delete,
                                      width: Dimens.fifteen,
                                      height: Dimens.fifteen,
                                    ),
                                    Dimens.boxWidth5,
                                    Text(
                                      StringConstants.delete,
                                      style: Styles.boldBlack16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                Container(
                  width: Dimens.percentWidth(.9),
                  height: Dimens.percentHeight(.53),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGreyColor),
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _controller.selectedPrescriptions.length,
                    padding: Dimens.edgeInsets10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 3,
                            childAspectRatio: .2 / .25),
                    itemBuilder: (context, index) => InkWell(
                      onTap: !_controller.isSelectionAvailable
                          ? () {
                              Get.dialog<dynamic>(
                                Material(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      Dimens.fifteen,
                                      Dimens.percentHeight(.15),
                                      Dimens.fifteen,
                                      Dimens.percentHeight(.15),
                                    ),
                                    child: Container(
                                      width: Dimens.percentWidth(.8),
                                      height: Dimens.percentHeight(.7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.ten,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Image.file(
                                        _controller
                                            .selectedPrescriptions[index],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          : () {
                              if (_controller.selectedIndexes.contains(index)) {
                                _controller.selectedIndexes.remove(index);
                              } else {
                                _controller.selectedIndexes.add(index);
                              }
                              _controller.update();
                            },
                      child: Stack(
                        children: [
                          Container(
                            height: Dimens.oneHundredTwenty,
                            width: Dimens.hundred,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimens.twelve),
                              color: const Color(0xffFAFAFA),
                            ),
                            child: Image.file(
                              _controller.selectedPrescriptions[index],
                            ),
                          ),
                          _controller.isSelectionAvailable
                              ? _controller.selectedIndexes.contains(index)
                                  ? Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        AssetConstants.selectedPrescription,
                                        width: Dimens.fifteen,
                                        height: Dimens.fifteen,
                                      ),
                                    )
                                  : Dimens.box0
                              : Dimens.box0,
                        ],
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                InkWell(
                  onTap: () {
                    if (_controller.selectedPrescriptions.isNotEmpty) {
                      RouteManagement.goToOrderFromPrescription();
                    }
                  },
                  child: Container(
                    width: Dimens.percentWidth(.9),
                    height: Dimens.fifty,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.eight),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        StringConstants.continue1,
                        style: Styles.boldWhite16,
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

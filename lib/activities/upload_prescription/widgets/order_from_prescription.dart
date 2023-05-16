import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class OrderFromPrescription extends StatefulWidget {
  @override
  State<OrderFromPrescription> createState() => _OrderFromPrescriptionState();
}

class _OrderFromPrescriptionState extends State<OrderFromPrescription> {
  var selectedType = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.orderFromPrescription,
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
                Text(
                  StringConstants.addedPrescription,
                  style: Styles.lightGrey16,
                ),
                Dimens.boxHeight10,
                Container(
                  width: Dimens.percentWidth(1),
                  height: Dimens.oneHundredFifty,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.five),
                    border: Border.all(color: AppColors.greyLight),
                  ),
                  child: ListView.builder(
                    itemCount: _controller.selectedPrescriptions.length,
                    padding: Dimens.edgeInsets10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: Dimens.edgeInsets0_0_10_0,
                      child: Container(
                        height: Dimens.oneHundredTwenty,
                        width: Dimens.hundred,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.twelve),
                          color: const Color(0xffFAFAFA),
                        ),
                        child: Image.file(
                          _controller.selectedPrescriptions[index],
                        ),
                      ),
                    ),
                  ),
                ),
                Dimens.boxHeight20,
                Text(
                  StringConstants.chooseYourMode,
                  style: Styles.lightGrey16,
                ),
                Dimens.boxHeight20,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimens.twentyFour,
                      height: Dimens.twentyFour,
                      child: Radio(
                        value: 1,
                        groupValue: selectedType,
                        onChanged: (value) {
                          selectedType = 1;
                          setState(() {});
                        },
                      ),
                    ),
                    Dimens.boxWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.orderEverythingFromPrescription,
                          style: selectedType == 1
                              ? Styles.boldBlack16W700
                              : Styles.boldBlack16,
                        ),
                        Dimens.boxHeight5,
                        SizedBox(
                          width: Dimens.percentWidth(.8),
                          child: Text(
                            StringConstants.orderEverythingFromPrescription1,
                            style: Styles.grey12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimens.twentyFour,
                      height: Dimens.twentyFour,
                      child: Radio(
                        value: 2,
                        groupValue: selectedType,
                        onChanged: (value) {
                          selectedType = 2;
                          setState(() {});
                        },
                      ),
                    ),
                    Dimens.boxWidth10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.getCallFromPharmacy,
                          style: selectedType == 2
                              ? Styles.boldBlack16W700
                              : Styles.boldBlack16,
                        ),
                        Dimens.boxHeight5,
                        SizedBox(
                          width: Dimens.percentWidth(.8),
                          child: Text(
                            StringConstants.getCallFromPharmacy1,
                            style: Styles.grey12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                const Divider(),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    await _controller.uploadFile(
                        isCall: selectedType == 2 ? true : false);
                    RouteManagement.goToUploadPrescriptionSuccess();
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

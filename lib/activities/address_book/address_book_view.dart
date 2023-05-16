import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class AddressBookView extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.addressBook,
            action: GestureDetector(
              onTap: () {
                Get.back<dynamic>();
                RouteManagement.goToAddAddress(isFromCart: false);
              },
              child: Center(
                child: Padding(
                  padding: Dimens.edgeInsets0_0_10_0,
                  child: Text(
                    '+ ${StringConstants.add}',
                    style: Styles.primary16Bold,
                  ),
                ),
              ),
            ),
          ),
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
        ),
        body: GetBuilder<HomeController>(
          builder: (_controller) => SizedBox(
            width: Dimens.percentWidth(1),
            height: Dimens.percentHeight(1),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(.9),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.addressesResponse?.data?.length,
                    padding: Dimens.edgeInsets20,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Dimens.boxWidth10,
                              Text(
                                '${_controller.addressesResponse?.data?[index].type}',
                                style: homeController.selectedAddress == index
                                    ? Styles.boldBlack16W700
                                    : Styles.boldBlack16,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  _controller.deleteAddress(
                                      loading: true,
                                      addressId:
                                          '${_controller.addressesResponse?.data?[index].id}');
                                },
                                child: SizedBox(
                                  width: Dimens.twentyFour,
                                  height: Dimens.twentyFour,
                                  child: Image.asset(
                                    AssetConstants.delete,
                                    width: Dimens.fifteen,
                                    height: Dimens.fifteen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Dimens.boxWidth10,
                              SizedBox(
                                width: Dimens.percentWidth(.7),
                                child: Text(
                                  '${_controller.addressesResponse?.data?[index].line1} ${_controller.addressesResponse?.data?[index].city}',
                                  style: Styles.lightGrey14,
                                ),
                              ),
                            ],
                          ),
                          Dimens.boxHeight10,
                          index ==
                                  _controller.addressesResponse!.data!.length -
                                      1
                              ? Dimens.box0
                              : const Divider(),
                        ],
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

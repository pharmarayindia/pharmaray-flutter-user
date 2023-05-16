import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';

class AddressBookWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (_controller) => Container(
          width: Dimens.percentWidth(1),
          height: Dimens.percentHeight(.55),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.ten),
              topRight: Radius.circular(Dimens.ten),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: Dimens.edgeInsets20_20_20_10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AssetConstants.locationIcon,
                          width: Dimens.fifteen,
                          height: Dimens.fifteen,
                        ),
                        Dimens.boxWidth10,
                        Text(
                          StringConstants.addressBook,
                          style: Styles.black20,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back<dynamic>();
                        RouteManagement.goToAddAddress(isFromCart: false);
                      },
                      child: Text(
                        '+ ${StringConstants.add}',
                        style: Styles.primary14Bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                width: Dimens.percentWidth(1),
                height: Dimens.percentHeight(.4),
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
                            SizedBox(
                              width: Dimens.twentyFour,
                              height: Dimens.twentyFour,
                              child: Radio(
                                value: index,
                                groupValue: _controller.selectedAddress,
                                onChanged: (value) {
                                  _controller.selectedAddress = index;
                                  _controller.update();
                                },
                              ),
                            ),
                            Dimens.boxWidth10,
                            Text(
                                '${_controller.addressesResponse?.data?[index].type}'),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Get.back<dynamic>();
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
                                // IconButton(
                                //   onPressed: () {a
                                //   },
                                //   icon: const Icon(
                                //     Icons.delete_outline,
                                //     color: Colors.red,
                                //   ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: Dimens.twentyFour,
                            ),
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
                        Dimens.boxHeight30,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

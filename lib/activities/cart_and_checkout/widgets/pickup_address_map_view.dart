import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:url_launcher/url_launcher.dart';

class PickupAddressMapView extends StatefulWidget {
  @override
  State<PickupAddressMapView> createState() => _PickupAddressMapViewState();
}

class _PickupAddressMapViewState extends State<PickupAddressMapView> {
  var args = Get.arguments as Map<String, dynamic>;
  String title = '';
  String subTitle = '';
  String? couponCode;
  var homeController = Get.find<HomeController>();

  dynamic _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Can not open URL');
    }
  }

  @override
  void initState() {
    title = args['title'] as String? ?? '';
    subTitle = args['subTitle'] as String? ?? '';
    couponCode = args['couponCode'] as String? ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
          child: CustomAppBar(title: StringConstants.pickUpAddress),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Dimens.edgeInsets20_0_20_0,
              child: Row(
                children: [
                  Text(
                    title,
                    style: Styles.boldBlack16,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      _launchURL(
                          'https://www.google.com/maps/place/Labdhi+Medical/@23.0600851,72.5667485,17z/data=!4m5!3m4!1s0x395e837f749f4339:0xe0166046df7b5c25!8m2!3d23.0600851!4d72.5667485');
                    },
                    child: Image.asset(
                      AssetConstants.locationIcon,
                      width: Dimens.twentyFive,
                      height: Dimens.twentyFive,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: Dimens.edgeInsets20_0_20_0,
              child: SizedBox(
                width: Dimens.percentWidth(.8),
                child: Text(
                  subTitle,
                  style: Styles.lightGrey14,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: Dimens.edgeInsets20,
              child: FormSubmitWidget(
                text: StringConstants.proceedToCheckout,
                textStyle: Styles.whiteLight16,
                padding: Dimens.edgeInsets10_0_10_0,
                buttonColor: AppColors.primaryColor,
                onTap: () async {
                  var list = <dynamic>[];
                  for (var i = 0;
                      i < homeController.cartResponse!.data!.length;
                      i++) {
                    list.add({
                      'productId': num.parse(
                          '${homeController.cartResponse?.data?[i].productId}'),
                      'quantity': num.parse(
                          '${homeController.cartResponse?.data?[i].quantity}')
                    });
                  }
                  var res = await homeController.createOrder(
                      loading: true,
                      cartItems: list,
                      orderPlacedType: 'Self/pickup',
                      userAddressId: int.parse(
                          '${homeController.addressesResponse?.data?[homeController.selectedAddress].id}'),
                      couponCode: couponCode == null ? null : couponCode);
                  if (res == true) {
                    RouteManagement.goToSelectPaymentMethod();
                  }
                },
              ),
            )
          ],
        ),
      );
}

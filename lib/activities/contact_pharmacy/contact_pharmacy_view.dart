import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmaray/lib.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPharmacy extends StatelessWidget {
  dynamic _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Can not open URL');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.contactPharmacy,
          ),
          preferredSize: Size(Dimens.percentWidth(1), Dimens.fifty),
        ),
        body: GetBuilder<ContactPharmacyController>(
          builder: (_controller) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: Dimens.percentWidth(1),
                  height: Dimens.percentHeight(1),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: Dimens.edgeInsets20,
                    children: [
                      Text(
                        StringConstants.callUsOn,
                        style: Styles.grey16w500,
                      ),
                      Dimens.boxHeight30,
                      InkWell(
                        onTap: () async {
                          var telephoneUrl = 'tel:+918488015200';
                          _launchURL(telephoneUrl);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AssetConstants.contactPharmacy,
                                  width: Dimens.fifteen,
                                  height: Dimens.fifteen,
                                ),
                                Dimens.boxWidth10,
                                Text(
                                  '+91 84880 15200',
                                  style: Styles.boldBlack18W400,
                                ),
                              ],
                            ),
                            Image.asset(
                              AssetConstants.copy,
                              width: Dimens.fifteen,
                              height: Dimens.fifteen,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight20,
                      const Divider(),
                      Dimens.boxHeight20,
                      Text(
                        StringConstants.pharmacyAddress,
                        style: Styles.grey16w500,
                      ),
                      Dimens.boxHeight20,
                      InkWell(
                        onTap: () {
                          _launchURL(
                              'https://www.google.com/maps/place/Labdhi+Medical/@23.0600851,72.5667485,17z/data=!4m5!3m4!1s0x395e837f749f4339:0xe0166046df7b5c25!8m2!3d23.0600851!4d72.5667485');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Labdhi Medical',
                                  style: Styles.boldBlack18W400,
                                ),
                                Image.asset(
                                  AssetConstants.copy,
                                  width: Dimens.fifteen,
                                  height: Dimens.fifteen,
                                ),
                              ],
                            ),
                            Text(
                              '2/27 -B Viranager Socitey, Bhimjipura, Nava Vadaj, Ahmedabad',
                              style: Styles.grey16w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

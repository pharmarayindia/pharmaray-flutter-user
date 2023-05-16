import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmaray/lib.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HowToAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: 'How to book a pathology lab test',
          ),
          preferredSize: Size(
            Dimens.percentWidth(1),
            Dimens.fifty,
          ),
        ),
        body: Padding(
          padding: Dimens.edgeInsets20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetConstants.microscope,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                    color: Colors.cyan[200],
                  ),
                  Dimens.boxWidth10,
                  SizedBox(
                    width: Dimens.percentWidth(.78),
                    child: Text(
                      'We have two options to book your pathology test at your doorstep with your convenient time.',
                      style: Styles.black14,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetConstants.support,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                    color: Colors.red[200],
                  ),
                  Dimens.boxWidth10,
                  SizedBox(
                    width: Dimens.percentWidth(.78),
                    child: Text(
                      'You can contact us directly via call and book your pathology test.',
                      style: Styles.black14,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight20,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetConstants.contactPharmacy,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                    color: Colors.yellow[500],
                  ),
                  Dimens.boxWidth10,
                  SizedBox(
                    width: Dimens.percentWidth(.78),
                    child: Text(
                      'If you have a prescription then share us on WhatsApp and book your pathology test.',
                      style: Styles.black14,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight40,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimens.percentWidth(.5),
                    height: Dimens.percentHeight(.3),
                    child: Lottie.asset(
                      AssetConstants.blood,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight40,
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormSubmitWidget(
                    text: 'Whatsapp',
                    textStyle: Styles.whiteLight16,
                    buttonWidth: Dimens.percentWidth(.42),
                    padding: Dimens.edgeInsets10_0_10_0,
                    isIconShowLeft: true,
                    iconPath: AssetConstants.whatsapp,
                    buttonColor: AppColors.whatsappGreen,
                    onTap: () {
                      launchUrlString(
                        'https://wa.me/918488015200?text=Hello%20PharmaRay%2C%20i%20am%20looking%20for%20pathology%20lab%20test.',
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                  FormSubmitWidget(
                    text: 'Call',
                    textStyle: Styles.whiteLight16,
                    buttonWidth: Dimens.percentWidth(.42),
                    padding: Dimens.edgeInsets10_0_10_0,
                    isIconShowLeft: true,
                    iconPath: AssetConstants.contactPharmacy,
                    iconColor: Colors.white,
                    buttonColor: AppColors.whatsappGreen,
                    onTap: () {
                      launchUrl(Uri.parse('tel://+918488015200'));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

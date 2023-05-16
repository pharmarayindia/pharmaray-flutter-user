import 'package:flutter/material.dart';
import 'package:pharmaray/lib.dart';

class HowToUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: CustomAppBar(
            title: StringConstants.howToUpload,
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
                children: [
                  Image.asset(
                    AssetConstants.uploadPrescription1,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                  ),
                  Dimens.boxWidth5,
                  SizedBox(
                    width: Dimens.percentWidth(.8),
                    child: Text(
                      StringConstants.uploadPrescription2,
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
                    AssetConstants.uploadPrescription2,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                  ),
                  Dimens.boxWidth5,
                  SizedBox(
                    width: Dimens.percentWidth(.8),
                    child: Text(
                      StringConstants.uploadPrescription3,
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
                    AssetConstants.uploadPrescription3,
                    width: Dimens.thirty,
                    height: Dimens.thirty,
                  ),
                  Dimens.boxWidth5,
                  SizedBox(
                    width: Dimens.percentWidth(.8),
                    child: Text(
                      StringConstants.uploadPrescription4,
                      style: Styles.black14,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight40,
              Text(
                StringConstants.visualGuide,
                style: Styles.grey18,
              ),
              Container(
                width: Dimens.percentWidth(1),
                height: Dimens.percentHeight(.58),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetConstants.prescriptionGuide),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

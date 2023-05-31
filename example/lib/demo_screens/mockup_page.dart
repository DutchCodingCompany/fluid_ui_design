import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

import 'mockup_settings_data_object.dart';

class MockupPage extends StatelessWidget {
  const MockupPage({super.key, required this.config, required this.textScaleHelper, required this.settingsDataObject});

  final FluidConfig config;
  final TextScaleHelper textScaleHelper;
  final MockupSettingsDataObject settingsDataObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(settingsDataObject.pagePadding.getSize(config)),
      child: Column(
        children: [
          Text('Welcome to this page', style: settingsDataObject.typefaceTitle1.getTextStyleForType(textScaleHelper)),
          SizedBox(height: settingsDataObject.spacingBetweenTitleAndText.getSize(config)),
          Row(
            children: [
              //a lot of lorum ipsum in text across multiple lines
              Flexible(
                  flex: 3,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, '
                    'ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, '
                    'varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy '
                    'molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. '
                    'Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. '
                    'Pellentesque congue. Ut in risus volutpat libero pharetra tempor. '
                    'Cras vestibulum bibendum augue. Praesent egestas leo in pede. '
                    'Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. '
                    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia '
                    'Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. '
                    'Maecenas adipiscing ante non diam sodales hendrerit.',
                    style: settingsDataObject.typefaceBodyText1.getTextStyleForType(textScaleHelper),
                    maxLines: 10,
                  )),
              SizedBox(width: settingsDataObject.spacingBetweenTextAndImage1.getSize(config)),
              Flexible(
                flex: 2,
                child: Image.network(
                    'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
              ),
            ],
          ),
          SizedBox(height: settingsDataObject.spacingBetweenTextAndSubtitle.getSize(config)),
          Text('This is a smaller title to a next section',
              style: settingsDataObject.typefaceTitle2.getTextStyleForType(textScaleHelper)),
          SizedBox(height: settingsDataObject.spacingBetweenSubtitleAndText.getSize(config)),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Image.network(
                    'https://images.pexels.com/photos/20788/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1250'),
              ),
              SizedBox(width: config.spaces.m),
              Flexible(
                  flex: 3,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, '
                    'ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, '
                    'varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy '
                    'molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. '
                    'Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. '
                    'Pellentesque congue. Ut in risus volutpat libero pharetra tempor. '
                    'Cras vestibulum bibendum augue. Praesent egestas leo in pede. '
                    'Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. '
                    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia '
                    'Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. '
                    'Maecenas adipiscing ante non diam sodales hendrerit.',
                    style: settingsDataObject.typefaceBodyText2.getTextStyleForType(textScaleHelper),
                    maxLines: 10,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

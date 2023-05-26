import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';

class MockupPage extends StatelessWidget {
  const MockupPage({super.key, required this.config, required this.textScaleHelper});

  final FluidConfig config;
  final TextScaleHelper textScaleHelper;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(FluidSize(fluidConfig: config, min: config.spaces.xxl, max: config.spaces.s).value),
      child: Column(
        children: [
          Text('Welcome to this page', style: textScaleHelper.headlineLarge),
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
                    style: textScaleHelper.bodyMedium,
                    maxLines: 10,
                  )),
              SizedBox(width: config.spaces.m),
              Flexible(
                flex: 2,
                child: Image.network(
                    'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
              ),
            ],
          ),
          SizedBox(height: config.spaces.m),
          Text('This is a smaller title to a next section', style: textScaleHelper.headlineSmall),
          SizedBox(height: config.spaces.s),
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
                    style: textScaleHelper.bodyMedium,
                    maxLines: 10,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

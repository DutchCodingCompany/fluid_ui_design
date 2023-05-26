import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'demo_screens/mockup_page.dart';
import 'demo_screens/typeface_demo/typeface_scale_widget.dart';
import 'util/widget_list_extension.dart';

class PlaygroundPage extends StatefulWidget {
  const PlaygroundPage({super.key});

  @override
  State<PlaygroundPage> createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage> {
  int currentFontIndex = 0;
  TextScaleHelper? _value;
  FluidConfig _config = const FluidConfig(1024);
  PageType pageType = PageType.mockupPage;

  List<TextScaleHelper> availableFonts = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setFonts();
  }

  void setSelectedFontIndex(int index) => setState(() {
        currentFontIndex = index;
        setFonts();
      });

  void setWidth(double width) => setState(() {
        _config = FluidConfig(width);
        setFonts();
      });

  void setFonts() => setState(() {
        availableFonts = [
          _config.fromGoogleFont(GoogleFonts.firaSans),
          _config.fromGoogleFont(GoogleFonts.firaMono),
          _config.fromGoogleFont(GoogleFonts.roboto),
          _config.fromGoogleFont(GoogleFonts.comicNeue)
        ];
        _value = availableFonts[currentFontIndex];
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.fluid.spaces.m),
          child: Column(
            children: [
              Wrap(
                children: PageType.values
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.toString().split('.').last),
                        selected: pageType == e,
                        onSelected: (bool selected) => setState(() {
                          pageType = e;
                        }),
                      ),
                    )
                    .toList()
                    .withSeperator(SizedBox(width: context.fluid.spaces.m)),
              ),
              Wrap(
                children: availableFonts
                    .map(
                      (e) => ChoiceChip(
                        label: Text(e.bodyLarge.fontFamily!),
                        selected: _value == e,
                        onSelected: (bool selected) => setSelectedFontIndex(availableFonts.indexOf(e)),
                      ),
                    )
                    .toList()
                    .withSeperator(SizedBox(width: context.fluid.spaces.m)),
              ),
              SizedBox(
                width: double.infinity,
                child: Slider(
                  value: _config.screenWidth,
                  min: _config.viewportConfig.minViewportSize,
                  max: _config.viewportConfig.maxViewportSize,
                  label: _config.screenWidth.round().toString(),
                  onChanged: (double value) => setWidth(value),
                ),
              ),
              Text('Screenwidth: ${_config.screenWidth}'),
              Container(
                //add borders
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                width: _config.screenWidth,
                height: _config.screenWidth * FluidSize(fluidConfig: _config, min: 1.25, max: 0.75).value,
                child: SingleChildScrollView(
                  child: switch (pageType) {
                    PageType.typefaceScale => TypefaceScaleWidget(config: _config, textScaleHelper: _value!),
                    PageType.mockupPage => MockupPage(config: _config, textScaleHelper: _value!),
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum PageType { typefaceScale, mockupPage }

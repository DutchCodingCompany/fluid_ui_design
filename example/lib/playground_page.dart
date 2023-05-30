import 'package:device_preview/device_preview.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            // show logo-no-background.png
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(context.fluid.spaces.m),
              child: Image.asset(
                "assets/logo/logo-no-background.png",
                width: double.infinity,
              ),
            ),
            ExpansionTile(
              title: const Text("Page Type"),
              leading: const Icon(Icons.pages), //add icon
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.fluid.spaces.s),
                  child: Wrap(
                    children: PageType.values
                        .map(
                          (e) => ChoiceChip(
                            selectedColor: Theme.of(context).primaryColor,
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
                )
              ],
            ),
            ExpansionTile(
              title: const Text("Font types"),
              leading: const Icon(Icons.font_download), //add icon
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.fluid.spaces.s),
                  child: Wrap(
                    children: availableFonts
                        .map(
                          (e) => ChoiceChip(
                            selectedColor: Theme.of(context).primaryColor,
                            label: Text(e.bodyLarge.fontFamily!),
                            selected: _value == e,
                            onSelected: (bool selected) => setSelectedFontIndex(availableFonts.indexOf(e)),
                          ),
                        )
                        .toList()
                        .withSeperator(SizedBox(width: context.fluid.spaces.m)),
                  ),
                ),

                //more child menu
              ],
            )
          ],
        )),
      ),
      body: DevicePreview(
          enabled: true,
          builder: (context) => Scaffold(
                body: SingleChildScrollView(
                  child: switch (pageType) {
                    PageType.typefaceScale => TypefaceScaleWidget(config: _config, textScaleHelper: _value!),
                    PageType.mockupPage => MockupPage(config: _config, textScaleHelper: _value!),
                  },
                ),
              )),
    );
  }
}

enum PageType { typefaceScale, mockupPage }

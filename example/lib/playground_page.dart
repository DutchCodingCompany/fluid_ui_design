import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'demo_screens/fluid_size_config.dart';
import 'demo_screens/mockup_page.dart';
import 'demo_screens/mockup_settings_data_object.dart';
import 'demo_screens/typeface_demo/typeface_scale_widget.dart';
import 'demo_screens/typeface_type.dart';
import 'util/widget_list_extension.dart';
import 'widgets/setting_input_field.dart';
import 'widgets/slider_screen_wrapper.dart';

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

  late MockupSettingsDataObject mockupSettingsDataObject;

  List<TextScaleHelper> availableFonts = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setFonts();
  }

  @override
  void initState() {
    super.initState();
    mockupSettingsDataObject = MockupSettingsDataObject(
      typefaceTitle1: TypefaceType.headlineLarge,
      typefaceTitle2: TypefaceType.headlineMedium,
      typefaceBodyText1: TypefaceType.bodyMedium,
      typefaceBodyText2: TypefaceType.bodyMedium,
      pagePadding: FluidSizeConfig.spacePair('xxl', 's'),
      spacingBetweenTextAndImage1: FluidSizeConfig.space('m'),
      spacingBetweenTextAndImage2: FluidSizeConfig.space('m'),
      spacingBetweenTitleAndText: FluidSizeConfig.space('m'),
      spacingBetweenTextAndSubtitle: FluidSizeConfig.space('m'),
      spacingBetweenSubtitleAndText: FluidSizeConfig.space('s'),
    );
  }

  void setConfig(FluidConfig config) => setState(() {
        if (config.viewportConfig.minViewportSize >= config.viewportConfig.maxViewportSize) {
          config = config.copyWith(
              viewportConfig:
                  config.viewportConfig.copyWith(minViewportSize: config.viewportConfig.maxViewportSize - 1));
        }

        if (config.viewportConfig.minViewportSize > config.screenWidth) {
          _config = config.copyWith(screenWidth: config.viewportConfig.minViewportSize);
        } else if (config.viewportConfig.maxViewportSize < config.screenWidth) {
          _config = config.copyWith(screenWidth: config.viewportConfig.maxViewportSize);
        } else {
          _config = config;
        }

        setFonts();
      });

  void setSelectedFontIndex(int index) => setState(() {
        currentFontIndex = index;
        setFonts();
      });

  void setWidth(double width) => setState(() {
        _config = _config.copyWith(screenWidth: width);
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
            if (pageType == PageType.mockupPage)
              ExpansionTile(
                title: const Text("Mockup Page Configuration"),
                leading: const Icon(Icons.dashboard_customize_outlined), //add icon
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.fluid.spaces.s),
                    child: DropdownMenu(
                        initialSelection: mockupSettingsDataObject.typefaceTitle1,
                        label: Text('Title Text Scale', style: Theme.of(context).textTheme.bodySmall),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        onSelected: (value) => setState(() {
                              mockupSettingsDataObject = mockupSettingsDataObject.copyWith(typefaceTitle1: value);
                            }),
                        dropdownMenuEntries: TypefaceType.values
                            .map((e) => DropdownMenuEntry(
                                  value: e,
                                  label: e.toString(),
                                ))
                            .toList()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.fluid.spaces.s),
                    child: DropdownMenu(
                        initialSelection: mockupSettingsDataObject.typefaceTitle2,
                        label: Text('Title Text Scale', style: Theme.of(context).textTheme.bodySmall),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        onSelected: (value) => setState(() {
                              mockupSettingsDataObject = mockupSettingsDataObject.copyWith(typefaceTitle2: value);
                            }),
                        dropdownMenuEntries: TypefaceType.values
                            .map((e) => DropdownMenuEntry(
                                  value: e,
                                  label: e.toString(),
                                ))
                            .toList()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.fluid.spaces.s),
                    child: DropdownMenu(
                        initialSelection: mockupSettingsDataObject.typefaceBodyText1,
                        label: Text('Body Text Scale', style: Theme.of(context).textTheme.bodySmall),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        onSelected: (value) => setState(() {
                              mockupSettingsDataObject = mockupSettingsDataObject.copyWith(typefaceBodyText1: value);
                            }),
                        dropdownMenuEntries: TypefaceType.values
                            .map((e) => DropdownMenuEntry(
                                  value: e,
                                  label: e.toString(),
                                ))
                            .toList()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.fluid.spaces.s),
                    child: DropdownMenu(
                        initialSelection: mockupSettingsDataObject.typefaceBodyText2,
                        label: Text('Body Text Scale', style: Theme.of(context).textTheme.bodySmall),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        onSelected: (value) => setState(() {
                              mockupSettingsDataObject = mockupSettingsDataObject.copyWith(typefaceBodyText2: value);
                            }),
                        dropdownMenuEntries: TypefaceType.values
                            .map((e) => DropdownMenuEntry(
                                  value: e,
                                  label: e.toString(),
                                ))
                            .toList()),
                  ),
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
              ],
            ),
            ExpansionTile(
              title: const Text("Viewport Config"),
              leading: const Icon(Icons.photo_size_select_large), //add icon
              children: [
                SettingInputField(
                  labelText: "Min Viewport Width",
                  value: _config.viewportConfig.minViewportSize.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      viewportConfig: _config.viewportConfig.copyWith(
                        minViewportSize: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "Max Viewport Width",
                  value: _config.viewportConfig.maxViewportSize.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      viewportConfig: _config.viewportConfig.copyWith(
                        maxViewportSize: double.parse(value),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Space Config"),
              leading: const Icon(Icons.rocket_launch), //add icon
              children: [
                SettingInputField(
                  labelText: "Base Min Space",
                  value: _config.spaceConfig.baseMin.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        baseMin: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "Base Max Space",
                  value: _config.spaceConfig.baseMax.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        baseMax: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XXXS Modifier",
                  value: _config.spaceConfig.xxxsModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xxxsModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XXS Modifier",
                  value: _config.spaceConfig.xxsModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xxsModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XS Modifier",
                  value: _config.spaceConfig.xsModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xsModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "S Modifier",
                  value: _config.spaceConfig.sModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        sModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "M Modifier",
                  value: _config.spaceConfig.mModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        mModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "L Modifier",
                  value: _config.spaceConfig.lModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        lModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XL Modifier",
                  value: _config.spaceConfig.xlModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xlModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XXL Modifier",
                  value: _config.spaceConfig.xxlModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xxlModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "XXXL Modifier",
                  value: _config.spaceConfig.xxxlModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      spaceConfig: _config.spaceConfig.copyWith(
                        xxxlModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Type Config"),
              leading: const Icon(Icons.text_increase), //add icon
              children: [
                SettingInputField(
                  labelText: "Min Base Font Size",
                  value: _config.typeConfig.minBaseFontSize.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      typeConfig: _config.typeConfig.copyWith(
                        minBaseFontSize: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "Max Base Font Size",
                  value: _config.typeConfig.maxBaseFontSize.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      typeConfig: _config.typeConfig.copyWith(
                        maxBaseFontSize: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "Min Type Scale Modifier",
                  value: _config.typeConfig.minTypeScaleModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      typeConfig: _config.typeConfig.copyWith(
                        minTypeScaleModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
                SettingInputField(
                  labelText: "Max Type Scale Modifier",
                  value: _config.typeConfig.maxTypeScaleModifier.toString(),
                  onChanged: (value) => setConfig(
                    _config.copyWith(
                      typeConfig: _config.typeConfig.copyWith(
                        maxTypeScaleModifier: double.parse(value),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: SliderScreenWrapper(
            onWidthChangeCallback: setWidth,
            config: _config,
            child: switch (pageType) {
              PageType.typefaceScale => TypefaceScaleWidget(config: _config, textScaleHelper: _value!),
              PageType.mockupPage => MockupPage(
                  config: _config,
                  textScaleHelper: _value!,
                  settingsDataObject: mockupSettingsDataObject,
                ),
            },
          ),
        ),
      ),
    );
  }
}

enum PageType { typefaceScale, mockupPage }

# Fluid UI Design [BETA 🪄]

Fluid UI Design is a package that helps implement a Fluid Design based on the Utopia principle (https://utopia.fyi). Instead of using breakpoints to create a responsive design, Fluid UI Design calculates sizing values based on the scale defined before and the ratio of the screen size.
Before using this package, it is adviced to read the article on Utopia (https://utopia.fyi) to better understand the principles behind this design phylosophy.

Keep in mind this is a 0.0.1 beta version of this framework, so there are still some bugs and not all features are implemented yet. If you find a bug or have a feature request, please create an issue on Github.

## Getting Started

To make use of all Fluid classes in your layout, you need to provide a config object as a theme extension to your theme. This will make all Fluid classes available in your theme.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FluidConfig config = FluidConfig.fromContext(context);

    return MaterialApp(
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          config,
        ],
      ),
      home: const MyHomePage(),
    );
  }
}
```

This will load the app with predefined scales and breakpoints. To customize the scales and breakpoints, you can pass them to the FluidWrapper.

```dart
     FluidConfig config = FluidConfig.fromContext(context,
        spaceConfig: SpaceConfig(
          baseMin: 4,
          baseMax: 8,
          xxxsModifier: 0.25,
          xxsModifier: 0.5,
          xsModifier: 0.75,
          sModifier: 1,
          mModifier: 1.5,
          lModifier: 2,
          xlModifier: 3,
          xxlModifier: 4,
          xxxlModifier: 6,
        ),
        typeConfig: TypeConfig(
          minBaseFontSize: 16,
          maxBaseFontSize: 20,
          minTypeScaleModifier: 1.2,
          maxTypeScaleModifier: 1.5,
        ),
        viewportConfig: ViewportConfig(
          minViewportSize: 320,
          maxViewportSize: 1200,
        ));

    return MaterialApp(
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[
          config,
        ],
      ),
      home: const MyHomePage(),
    );
```

## Fluid Classes
### Fluid Config

If you need to access the config in your code, you can use the FluidConfig class. This class is a wrapper around the config object and provides some helper methods to get the current viewport size and the current scale modifier.
We saved this config file in the theme, so you can access it from the theme. Using the following code will retrieve the config from the theme we created earlier;

```dart
  FluidConfig config = FluidConfig.of(context);
```

or using the extension on BuildContext

```dart
  FluidConfig config = context.fluid;
```

### FluidSize

Fluid Size is the basic class to determine a size. It can be used to get a linear value based on the current screen size compared to the min and max set to the FluidWrapper.

```dart
FluidSize(fluidConfig: context.fluid,  min: 100, max: 200);
```

When on the smallest screensize/breakpoint it will return 100. When on the maximal screensize/breakpoint it will return 200. When on a screensize/breakpoint in between it will return a value in between.

### FluidSpace
FluidSpace is a layer over Fluid Size based on modifier scale set in the settings. A designer can create a Fluid Space scale in design; and by using these modifiers you get a logical scale of sizings usable in your layout. The class FluidSpaces is used as a preset of scales. 

To get a specific fluid space, you can get it by using the following code;

```dart
SizedBox(height: FluidSpaces(context.fluid).m.value);
```

A short way to write this is with a extension on BuildContext. This extension is available in the package.

```dart
SizedBox(height: context.fluid.spaces.m);
```

### FluidSpacePair
Sometimes you want to have a FluidSpace grow more or less based on screensize. On a large device, you want to have a lot more space on the top of your screen. This can be done with a FluidSpacePair. This class takes two FluidSpaces and will return the first one on small screens and the second one on large screens. When the screen size is in between, it will return a value in between.

```dart
FluidSpacePair(
  fluidConfig: context.fluid,
  small: FluidSpaces(context.fluid).m,
  large: FluidSpaces(context.fluid).xl,
);
```


### FluidType // FluidFontSize
FluidType is used to create a logical typescale. For typography, you want to have more difference in your fontsizes based on screensize. Using FluidType also scales the scale modifier based on screen size within the viewports. This means that the difference in font size will be bigger on a large screen than on a small screen. This is based on the Utopia principle. In general, we use a scale that from -10 to 10, where 0 is the base font size. This scale can be changed in the settings. To get the value of a specific scale, you can use the following code;

```dart
FluidType(fluidConfig: context.fluid, scaleStep: 2).value;
```

A short way to write this is with a extension on BuildContext. This extension is available in the package.

```dart
context.fluid.typeSize(2);
```

or

```dart
context.fluid.fontSize(2);
```

## TextScaleHelper
To make using TextScales easier, we provided a TextScaleHelper. This helper is built for a combination with GoogleFonts, but can be used for any font. A example of how this can be used with GoogleFonts is shown below;

```dart
  config.fromGoogleFont(GoogleFonts.firaSans).bold.displayLarge;
```

This will return a TextStyle with a bold font, correct scaled sizing and based on the Google Font Fira Sans. 

If you want to implement this scale helper with your another font, you need to create a TextScaleHelper object yourself and provide it with a callback function that will build your font using the correct provided parameters.

```dart
  TextScaleHelper(
      this,
      ({required FontWeight fontWeight, required double fontSize, required Color color}) {
        return TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          // add parameters here that define your desired font settings
        );
      },
    );
```
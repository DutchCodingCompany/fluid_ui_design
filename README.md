# fluid_ui_design

Fluid UI Design is a package that helps implement a Fluid Design based on the Utopia principle (https://utopia.fyi). Instead of using breakpoints to create a responsive design, Fluid UI Design calculates sizing values based on the scale defined before and the ratio of the screen size.
Before using this package, it is adviced to read the article on Utopia (https://utopia.fyi) to better understand the principles behind this design phylosophy.

## Getting Started

To make use of all Fluid classes in your layout, you need to wrap your widget tree in a FluidWrapper. This widget will provide the screen size to the Fluid classes.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const FluidWrapper(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
```

This will load the app with predefined scales and breakpoints. To customize the scales and breakpoints, you can pass them to the FluidWrapper.

```dart
 return const FluidWrapper(
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
      ),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
```

## Fluid Classes
### FluidSize

Fluid Size is the basic class to determine a size. It can be used to get a linear value based on the current screen size compared to the min and max set to the FluidWrapper.

```dart
FluidSize(min: 100, max: 200);
```

When on the smallest screensize/breakpoint it will return 100. When on the maximal screensize/breakpoint it will return 200. When on a screensize/breakpoint in between it will return a value in between.

### FluidSpace
FluidSpace is a layer over Fluid Size based on modifier scale set in the settings. A designer can create a Fluid Space scale in design; and by using these modifiers you get a logical scale of sizings usable in your layout. The class FluidSpaces is used as a preset of scales. This can be used for example:

```dart
SizedBox(height: FluidSpaåes.m)
```

### FluidSpacePair
Sometiems you want to have a FluidSpace grow more or less based on screensize. On a large device, you want to have a lot more space on the top of your screen. This can be done with a FluidSpacePair. This class takes two FluidSpaces and will return the first one on small screens and the second one on large screens. When the screen size is in between, it will return a value in between.

### FluidType
FluidType is used to create a logical typescale. For typography, you want to have more difference in your fontsizes based on screensize. Using FluidType also scales the scale modifier based on screen size within the viewports. This means that the difference in font size will be bigger on a large screen than on a small screen. This is based on the Utopia principle.
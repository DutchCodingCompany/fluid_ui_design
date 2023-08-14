import 'fluid_size_config.dart';
import 'typeface_type.dart';

class MockupSettingsDataObject {
  final TypefaceType typefaceTitle1;
  final TypefaceType typefaceTitle2;
  final TypefaceType typefaceBodyText1;
  final TypefaceType typefaceBodyText2;

  final FluidSizeConfig pagePadding;
  final FluidSizeConfig spacingBetweenTextAndImage1;
  final FluidSizeConfig spacingBetweenTextAndImage2;
  final FluidSizeConfig spacingBetweenTitleAndText;
  final FluidSizeConfig spacingBetweenTextAndSubtitle;
  final FluidSizeConfig spacingBetweenSubtitleAndText;

  MockupSettingsDataObject({
    required this.typefaceTitle1,
    required this.typefaceTitle2,
    required this.typefaceBodyText1,
    required this.typefaceBodyText2,
    required this.pagePadding,
    required this.spacingBetweenTextAndImage1,
    required this.spacingBetweenTextAndImage2,
    required this.spacingBetweenTitleAndText,
    required this.spacingBetweenTextAndSubtitle,
    required this.spacingBetweenSubtitleAndText,
  });

  MockupSettingsDataObject copyWith({
    TypefaceType? typefaceTitle1,
    TypefaceType? typefaceTitle2,
    TypefaceType? typefaceBodyText1,
    TypefaceType? typefaceBodyText2,
    FluidSizeConfig? pagePadding,
    FluidSizeConfig? spacingBetweenTextAndImage1,
    FluidSizeConfig? spacingBetweenTextAndImage2,
    FluidSizeConfig? spacingBetweenTitleAndText,
    FluidSizeConfig? spacingBetweenTextAndSubtitle,
    FluidSizeConfig? spacingBetweenSubtitleAndText,
  }) {
    return MockupSettingsDataObject(
      typefaceTitle1: typefaceTitle1 ?? this.typefaceTitle1,
      typefaceTitle2: typefaceTitle2 ?? this.typefaceTitle2,
      typefaceBodyText1: typefaceBodyText1 ?? this.typefaceBodyText1,
      typefaceBodyText2: typefaceBodyText2 ?? this.typefaceBodyText2,
      pagePadding: pagePadding ?? this.pagePadding,
      spacingBetweenTextAndImage1: spacingBetweenTextAndImage1 ?? this.spacingBetweenTextAndImage1,
      spacingBetweenTextAndImage2: spacingBetweenTextAndImage2 ?? this.spacingBetweenTextAndImage2,
      spacingBetweenTitleAndText: spacingBetweenTitleAndText ?? this.spacingBetweenTitleAndText,
      spacingBetweenTextAndSubtitle: spacingBetweenTextAndSubtitle ?? this.spacingBetweenTextAndSubtitle,
      spacingBetweenSubtitleAndText: spacingBetweenSubtitleAndText ?? this.spacingBetweenSubtitleAndText,
    );
  }
}

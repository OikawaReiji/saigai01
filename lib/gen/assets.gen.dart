/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/hard.png
  AssetGenImage get hard => const AssetGenImage('assets/img/hard.png');

  /// File path: assets/img/icon_focus.png
  AssetGenImage get iconFocus =>
      const AssetGenImage('assets/img/icon_focus.png');

  /// File path: assets/img/iii.jpg
  AssetGenImage get iii => const AssetGenImage('assets/img/iii.jpg');

  /// File path: assets/img/kuga.png
  AssetGenImage get kuga => const AssetGenImage('assets/img/kuga.png');

  /// File path: assets/img/map_icon.png
  AssetGenImage get mapIcon => const AssetGenImage('assets/img/map_icon.png');

  /// File path: assets/img/map_icon_selected.png
  AssetGenImage get mapIconSelected =>
      const AssetGenImage('assets/img/map_icon_selected.png');

  /// File path: assets/img/toppage_icon.jpg
  AssetGenImage get toppageIcon =>
      const AssetGenImage('assets/img/toppage_icon.jpg');

  /// File path: assets/img/wa.png
  AssetGenImage get wa => const AssetGenImage('assets/img/wa.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [hard, iconFocus, iii, kuga, mapIcon, mapIconSelected, toppageIcon, wa];
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/google_map_style.json
  String get googleMapStyle => 'assets/jsons/google_map_style.json';

  /// File path: assets/jsons/iwate.geojson
  String get iwate => 'assets/jsons/iwate.geojson';

  /// List of all assets
  List<String> get values => [googleMapStyle, iwate];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

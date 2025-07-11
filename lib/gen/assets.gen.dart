/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/baidu_icon.svg
  String get baiduIcon => 'assets/images/baidu_icon.svg';

  /// File path: assets/images/baidu_icon.svg.vec
  String get baiduIconSvg => 'assets/images/baidu_icon.svg.vec';

  /// File path: assets/images/deepseek_icon.svg
  String get deepseekIcon => 'assets/images/deepseek_icon.svg';

  /// File path: assets/images/deepseek_icon.svg.vec
  String get deepseekIconSvg => 'assets/images/deepseek_icon.svg.vec';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/google_icon.svg.vec
  String get googleIconSvg => 'assets/images/google_icon.svg.vec';

  /// File path: assets/images/page_not_found.png
  AssetGenImage get pageNotFound =>
      const AssetGenImage('assets/images/page_not_found.png');

  /// File path: assets/images/youdao_icon.svg
  String get youdaoIcon => 'assets/images/youdao_icon.svg';

  /// File path: assets/images/youdao_icon.svg.vec
  String get youdaoIconSvg => 'assets/images/youdao_icon.svg.vec';

  /// List of all assets
  List<dynamic> get values => [
    baiduIcon,
    baiduIconSvg,
    deepseekIcon,
    deepseekIconSvg,
    googleIcon,
    googleIconSvg,
    pageNotFound,
    youdaoIcon,
    youdaoIconSvg,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = 'assets/.env';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

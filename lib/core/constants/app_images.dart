class AppImages {
  AppImages._init();
  static AppImages? _instance;

  static AppImages get instance => _instance ??= AppImages._init();

  static String toPng(String name) => 'assets/images/$name.png';
  static String toSvg(String name) => 'assets/svg/$name.svg';
  static String toJPEG(String name) => 'assets/images/$name.jpg';



  // SVG 

  static String get carrotIcon => toSvg("carrot_icon");
  static String get loginImage => toSvg("login_images");
  static String get orderFail => toSvg("order_fail");
  static String get orderSuccess => toSvg("order_success");
  static String get redCarrot => toSvg("red_carrot");
  static String get splashIcon => toSvg("splash_icon");
  static String get personImage => toSvg("person_image");
  static String get googleIcon => toSvg("google");
  static String get facebookIcon => toSvg("facebook");

  // PNG
  static String get personImagePNG => toPng("person_image");
  static String get loginImagePNG => toPng("login_image");






  
}

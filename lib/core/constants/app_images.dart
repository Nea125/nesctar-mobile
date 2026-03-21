class AppImages {
  AppImages._init();
  static AppImages? _instance;

  static AppImages get instance => _instance ??= AppImages._init();

  static String toPng(String name) => 'assets/images/$name.png';
  static String toSvg(String name) => 'assets/svg/$name.svg';
  static String toJPEG(String name) => 'assets/images/$name.jpg';



  // SVG 

  static String get carrotIcon => toPng("carrot_icon");
  static String get loginImage => toPng("login_images");
  static String get orderFail => toPng("order_fail");
  static String get orderSuccess => toPng("order_success");
  static String get redCarrot => toPng("red_carrot");
  static String get splashIcon => toPng("splash_icon");






  
}

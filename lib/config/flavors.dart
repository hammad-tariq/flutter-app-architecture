enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://ae-api-dev.developine.com';
      case Flavor.prod:
        return 'https://ae-api.developine.com';
      default:
        return '';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'developine dev';
      case Flavor.prod:
        return 'developine ';
      default:
        return 'title';
    }
  }
}

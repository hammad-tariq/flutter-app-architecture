import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHandler {
  // LOGIN , SIGNUP EVENTS
  static const String loginSuccessEvent = "login";
  static const String signupEvent = "sign_up";
  static const String loginFailedEvent = "login_failed_event";
  static String passwordForgotEvent = "password_forgot_event";

  // A user search for content
  static const String searchEvent = "search";
  static const String shareEvent = "share";

  // A user completes a purchase
  static const String purchaseEvent = "purchase";
  static const String purchaseFailedEvent = "purchase_failed";
  static const String ratePurchaseEvent = "rate_purchase";
  static const String repeatPurchaseEvent = "repeat_purchase";

  // CART EVENTS
  static String removeFromCartEvent = "remove_from_cart";
  static String selectItemEvent = "select_item";
  static String addItemToCartEvent = "add_to_cart";

  // A user begins checkout
  static String beginCheckoutEvent = "begin_checkout";
  static String addShippingInfoEvent = "add_shipping_info";
  static String addPaymentInfoEvent = "add_payment_info";

  // A user add item to wishlist
  static String addItemWishlistEvent = "add_to_wishlist";

  // VIEW EVENTS
  static String viewItemListEvent = "view_item_list";
  static String viewCartEvent = "view_cart";
  static String viewCategoriesEvent = "view_categories";
  static String viewAccountEvent = "view_account_page";
  static String viewSettingsEvent = "view_settings_page";
  static String viewItemDetailPageEvent = "view_item_detail_page";
  static String viewPromotionEvent = "view_promotion";
  static String viewOrderHistoryEvent = "view_history";
  static String viewVideoAdEvent = "view_video_ad";
  static String viewPopularRecommendedEvent =
      "view_recommended_popular_section";

  // A user opens support/contact form.
  static String viewContactInfoEvent = "view_contact_info";

  // A user has opened notification from status bar.
  static String viewNotificationEvent = "notification_open";
  static String receiveNotificationEvent = "notification_receive";

  logFirebaseEvent(String eventName, Map<String, dynamic> params) async {
    await FirebaseAnalytics.instance
        .logEvent(name: eventName, parameters: params);
  }
}

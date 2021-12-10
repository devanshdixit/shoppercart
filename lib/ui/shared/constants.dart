import 'package:flutter/material.dart';

class Assets {
  static const String _imagesRoot = "assets/images/";
  static String bgtop = _imagesRoot + "bgtop.png";
  static String auth = _imagesRoot + "auth.png";
  static String locIcon = _imagesRoot + "locicon.png";
  static String storeIcon = _imagesRoot + "storeicon.png";
  static String cosco = _imagesRoot + "cosco.png";
  static String loblaws = _imagesRoot + "loblaws.png";
  static String rcs = _imagesRoot + "rcs.jpg";
  static String bag = _imagesRoot + "bag_24px.png";
  static String menu = _imagesRoot + "menu_24px.png";
  static String curr = _imagesRoot + "curr.png";
  static String asda = _imagesRoot + "asda.png";
  static String coop = _imagesRoot + "coop.jpg";
  static String debenhams = _imagesRoot + "debenhams.jpg";
  static String farmfoods = _imagesRoot + "farmfoods.png";
  static String footlocker = _imagesRoot + "footlocker.png";
  static String handm = _imagesRoot + "h&m.png";
  static String iceland = _imagesRoot + "iceland.png";
  static String jd = _imagesRoot + "jd.png";
  static String lidl = _imagesRoot + "lidl.png";
  static String mands = _imagesRoot + "m&s.png";
  static String morrisons = _imagesRoot + "morrisons.jpg";
  static String ocado = _imagesRoot + "ocado.png";
  static String poundland = _imagesRoot + "poundland.jpg";
  static String primark = _imagesRoot + "primark.png";
  static String riverisland = _imagesRoot + "riverisland.jpg";
  static String sainsbury = _imagesRoot + "sainsbury.png";
  static String skechers = _imagesRoot + "skechers.jpg";
  static String tesco = _imagesRoot + "tesco.jpg";
  static String waitrose = _imagesRoot + "waitrose.jpg";
  static String zara = _imagesRoot + "zara.png";

  static String curren = _imagesRoot + "curren.png";
  static String user = _imagesRoot + "user.png";
  static String bank = _imagesRoot + "bank.png";
  static String credit = _imagesRoot + "credit.png";
  static String emptyorder = _imagesRoot + "empty_order.png";
  static String ordericon = _imagesRoot + "ordericon.png";

  static String firebase = _imagesRoot + "rider.png";
  static String bgimg = _imagesRoot + "bgimg.png";
  static String btnbgimg = _imagesRoot + "btnbg.png";
  static String loadinimg = _imagesRoot + "loading.jpg";
  static String doneimg = _imagesRoot + "checked.png";

  static String getPaymentLink =
      'https://us-central1-unique-nuance-310113.cloudfunctions.net/getPaymentLink';
  static String getNotifyLink =
      'https://us-central1-unique-nuance-310113.cloudfunctions.net/sendNotification';
  static const double fourBy1 = 4.0;
  static const double fourBy2 = 8.0;
  static const double fourBy3 = 12.0;
  static const double fourBy4 = 16.0;

  static const double eightBy1 = 8.0;
  static const double eightBy2 = 16.0;
  static const double eightBy3 = 24.0;
  static const double eightBy4 = 32.0;

  static const double sixteenBy1 = 16.0;
  static const double sixteenBy2 = 32.0;
  static const double sixteenBy3 = 48.0;
  static const double sixteenBy4 = 64.0;
}

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.amber,
    ),
  ),
);

const carTypes = [
  'Family Ride 7 Seater Car',
  'Oga Ride 5 Seater Car',
  'Flixi 5 Seater Airport',
  "Flixi 5 Seater School Runner",
  'Picnic Tour 7 Seaters Car',
  'Picnic Tour 5 Seaters Car',
  'Oga Ride Private any seaters 4 to 7',
  'Self Drive Any Seaters',
  'Aven 17 Seater mini bus',
  'Aven 17 Seater Van',
  'Aven 17 seater executive',
];
const boatTypes = [
  'White Boat Oga Ride',
  'White Boat Family Ride',
  'White Boat Picnic Tour',
  'Banana Boat Flixi Ride',
  'Banana Boat Family  Ride',
  'Banana charter service',
];

class Shop {
  final String name;
  final String imagepath;
  Shop(this.name, this.imagepath);
}

List<Shop> shopList = [
  Shop('Associated Dairies', Assets.asda),
  Shop('Co-operative', Assets.coop),
  Shop('Costco', Assets.cosco),
  Shop('Debenhams', Assets.debenhams),
  Shop('FarmFoods', Assets.farmfoods),
  Shop('FootLocker', Assets.footlocker),
  Shop('Hennes & Mauritz', Assets.handm),
  Shop('IceLand', Assets.iceland),
  Shop('JD Sports', Assets.jd),
  Shop('Lidl', Assets.lidl),
  Shop('Loblaws', Assets.loblaws),
  Shop('Marks & Spencer', Assets.mands),
  Shop('Morrisons', Assets.morrisons),
  Shop('Ocado', Assets.ocado),
  Shop('PoundLand', Assets.poundland),
  Shop('Primark', Assets.primark),
  Shop('River Island', Assets.riverisland),
  Shop('Sainsbury', Assets.sainsbury),
  Shop('Skechers', Assets.skechers),
  Shop('Tesco', Assets.tesco),
  Shop('Waitrose', Assets.waitrose),
  Shop('Zara', Assets.zara),
  Shop('RCS', Assets.rcs),
];

String addtwostrings(String st1, String st2) {
  final d1 = double.parse(st1);
  final d2 = double.parse(st2);
  final d3 = d1 + d2;
  return d3.toString();
}

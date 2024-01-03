extension CalcFeePrice on int {
  int totalFeeCopart(int priceAuto) {
    return calcBuyerFeesPrice(priceAuto) +
        calcInternetBidFeePrice(priceAuto) +
        79 +
        20 +
        10;
  }

  int totalFeeIaai(int priceAuto) {
    return calcBuyerFeesPrice(priceAuto) +
        calcInternetBidFeePrice(priceAuto) +
        79 +
        15 +
        10;
  }

  int calcBuyerFeesPrice(int priceAuto) {
    if (priceAuto <= 0 || priceAuto <= 99.99) {
      return 1;
    } else if (priceAuto <= 100 || priceAuto <= 199.99) {
      return 25;
    } else if (priceAuto <= 200 || priceAuto <= 299.99) {
      return 60;
    } else if (priceAuto <= 300 || priceAuto <= 349.99) {
      return 80;
    } else if (priceAuto <= 350 || priceAuto <= 399.99) {
      return 90;
    } else if (priceAuto <= 400 || priceAuto <= 449.99) {
      return 120;
    } else if (priceAuto <= 450 || priceAuto <= 499.99) {
      return 130;
    } else if (priceAuto <= 500 || priceAuto <= 549.99) {
      return 140;
    } else if (priceAuto <= 550 || priceAuto <= 599.99) {
      return 150;
    } else if (priceAuto <= 600 || priceAuto <= 699.99) {
      return 165;
    } else if (priceAuto <= 700 || priceAuto <= 799.99) {
      return 185;
    } else if (priceAuto <= 800 || priceAuto <= 899.99) {
      return 200;
    } else if (priceAuto <= 900 || priceAuto <= 999.99) {
      return 215;
    } else if (priceAuto <= 1000 || priceAuto <= 1199.99) {
      return 230;
    } else if (priceAuto <= 1200 || priceAuto <= 1299.99) {
      return 255;
    } else if (priceAuto <= 1300 || priceAuto <= 1399.99) {
      return 275;
    } else if (priceAuto <= 1400 || priceAuto <= 1499.99) {
      return 280;
    } else if (priceAuto <= 1500 || priceAuto <= 1599.99) {
      return 290;
    } else if (priceAuto <= 1600 || priceAuto <= 1699.99) {
      return 305;
    } else if (priceAuto <= 1700 || priceAuto <= 1799.99) {
      return 315;
    } else if (priceAuto <= 1800 || priceAuto <= 1999.99) {
      return 325;
    } else if (priceAuto <= 2000 || priceAuto <= 2399.99) {
      return 355;
    } else if (priceAuto <= 2400 || priceAuto <= 2499.99) {
      return 380;
    } else if (priceAuto <= 2500 || priceAuto <= 2999.99) {
      return 400;
    } else if (priceAuto <= 3000 || priceAuto <= 3499.99) {
      return 450;
    } else if (priceAuto <= 3500 || priceAuto <= 3999.99) {
      return 500;
    } else if (priceAuto <= 4000 || priceAuto <= 4499.99) {
      return 600;
    } else if (priceAuto <= 4500 || priceAuto <= 4999.99) {
      return 625;
    } else if (priceAuto <= 5000 || priceAuto <= 5999.99) {
      return 650;
    } else if (priceAuto <= 6000 || priceAuto <= 6999.99) {
      return 675;
    } else if (priceAuto <= 7000 || priceAuto <= 7999.99) {
      return 700;
    } else if (priceAuto <= 8000 || priceAuto <= 9999.99) {
      return 725;
    } else if (priceAuto <= 10000 || priceAuto <= 11499.99) {
      return 750;
    } else if (priceAuto <= 11500 || priceAuto <= 11999.99) {
      return 760;
    } else if (priceAuto <= 12000 || priceAuto <= 12499.99) {
      return 775;
    } else if (priceAuto <= 12500 || priceAuto <= 14999.99) {
      return 790;
    } else {
      return (priceAuto.toDouble() * 0.06).toInt();
    }
  }

  int calcInternetBidFeePrice(int priceAuto) {
    if (priceAuto <= 0 || priceAuto <= 99.99) {
      return 0;
    } else if (priceAuto <= 100 || priceAuto <= 499.99) {
      return 49;
    } else if (priceAuto <= 500 || priceAuto <= 999.99) {
      return 59;
    } else if (priceAuto <= 1000 || priceAuto <= 1499.99) {
      return 79;
    } else if (priceAuto <= 1500 || priceAuto <= 1999.99) {
      return 89;
    } else if (priceAuto <= 2000 || priceAuto <= 3999.99) {
      return 99;
    } else if (priceAuto <= 4000 || priceAuto <= 5999.99) {
      return 109;
    } else if (priceAuto <= 6000 || priceAuto <= 7999.99) {
      return 139;
    } else {
      return 149;
    }
  }
}

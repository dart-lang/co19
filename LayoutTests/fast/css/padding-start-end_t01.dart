/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests padding-start and padding-end
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  test(dir, prop, value, queryProp)
  {
    var div = document.createElement('div');
    div.setAttribute('style', 'width:100px;' + prop + ':' + value);
    div.dir = dir;
    document.body.append(div);

    var result = getComputedStyle(div).getPropertyValue(queryProp);
    div.remove();
    return result;
  }

  testWidth(dir, prop, value)
  {
    var div = document.createElement('div');
    div.setAttribute('style', 'width:100px;' + prop + ':' + value);
    div.dir = dir;
    document.body.append(div);

    var result = div.offsetWidth;
    div.remove();
    return result;
  }

  shouldBe(testWidth("ltr", "-webkit-padding-start", "10px"), 110);
  shouldBe(testWidth("ltr", "-webkit-padding-end", "20px"), 120);
  shouldBeEqualToString(test("ltr", "-webkit-padding-start", "10px", "padding-left"), '10px');
  shouldBeEqualToString(test("ltr", "-webkit-padding-end", "20px", "padding-right"), '20px');
  shouldBeEqualToString(test("ltr", "padding-left", "10px", "-webkit-padding-start"), '10px');
  shouldBeEqualToString(test("ltr", "padding-right", "20px", "-webkit-padding-end"), '20px');

  shouldBe(testWidth("rtl", "-webkit-padding-start", "10px"), 110);
  shouldBe(testWidth("rtl", "-webkit-padding-end", "20px"), 120);
  shouldBeEqualToString(test("rtl", "-webkit-padding-start", "10px", "padding-right"), '10px');
  shouldBeEqualToString(test("rtl", "-webkit-padding-end", "20px", "padding-left"), '20px');
  shouldBeEqualToString(test("rtl", "padding-right", "10px", "-webkit-padding-start"), '10px');
  shouldBeEqualToString(test("rtl", "padding-left", "20px", "-webkit-padding-end"), '20px');
}

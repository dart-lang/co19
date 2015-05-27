/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests margin-start and margin-end
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  test(dir, prop, value, queryProp) {
    debug("$dir $prop $value $queryProp");
    var outerDiv = document.createElement('div');
    outerDiv.style.width = '100px';
    outerDiv.dir = dir;
    document.body.append(outerDiv);

    var div = document.createElement('div');
    div.text = '\u00a0'; // &nbsp;
    div.setAttribute('style', prop + ':' + value);
    outerDiv.append(div);

    var result = getComputedStyle(div).getPropertyValue(queryProp);
    outerDiv.remove();
    return result;
  }

  shouldBeEqualToString(test("ltr", "-webkit-margin-start", "10px", "width"), '90px');
  shouldBeEqualToString(test("ltr", "-webkit-margin-end", "20px", "width"), '80px');
  shouldBeEqualToString(test("ltr", "-webkit-margin-start", "10px", "margin-left"), '10px');
  shouldBeEqualToString(test("ltr", "-webkit-margin-end", "20px", "margin-right"), '20px');
  shouldBeEqualToString(test("ltr", "margin-left", "10px", "-webkit-margin-start"), '10px');
  shouldBeEqualToString(test("ltr", "margin-right", "20px", "-webkit-margin-end"), '20px');

  shouldBeEqualToString(test("rtl", "-webkit-margin-start", "10px", "width"), '90px');
  shouldBeEqualToString(test("rtl", "-webkit-margin-end", "20px", "width"), '80px');
  shouldBeEqualToString(test("rtl", "-webkit-margin-start", "10px", "margin-right"), '10px');
  shouldBeEqualToString(test("rtl", "-webkit-margin-end", "20px", "margin-left"), '20px');
  shouldBeEqualToString(test("rtl", "margin-right", "10px", "-webkit-margin-start"), '10px');
  shouldBeEqualToString(test("rtl", "margin-left", "20px", "-webkit-margin-end"), '20px');
}

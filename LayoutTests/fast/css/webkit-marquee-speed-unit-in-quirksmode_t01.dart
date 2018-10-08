/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>Layout test for <a href="https://bugs.webkit.org/show_bug.cgi?id=22096">bug 22096</a></p>
      <ol>
      <li>scrolldelay attribute of marquee sets -webkit-marquee-speed CSS property, but it sets unit-less number.
      <li>The number is treated by WebKit as quirks mode value and converts it to miliseconds for -webkit-marquee-speed (milisecond is proper unit for scrolldelay).
      </ol>
      <p>This simple test case checks if unit-less value for -webkit-marquee-speed in quirks mode is treated as miliseconds which is required for correctly working scrolldelay.</p>
      <marquee id="mar" style="-webkit-marquee-speed:10"></marquee>
      <p id="p"></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var mar = document.getElementById("mar");
    var p = document.getElementById("p");
    if (mar.style.getPropertyValue("-webkit-marquee-speed") == "10s")
      p.innerHtml = '<b style="color:red">FAIL</b>';
    else
      p.innerHtml = '<b style="color:green">PASS</b>';
    asyncEnd();
  });

}

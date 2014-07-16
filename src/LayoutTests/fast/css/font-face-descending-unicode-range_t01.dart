/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 41339 - unicode-range property only with a
 * descending range causes a crash
 * Interval unicode-ranges that descend are invalid and omitted. Without any
 * valid ranges, the descriptor is omitted. As a result, the @font-face rule in
 * this file is applied to all characters. This test passes if the following
 * i's and X's are shown in Courier and they have the same length on screen. As
 * of r62096, opening this file causes a crash instead.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: 'myfont';
          src: local(Courier), local('Courier New'); /* Use monospace font */
          unicode-range: U+062-60;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <div id="description"></div>
      <div style="font-family: 'myfont'">
      <span id="i_s" style="border:solid 1px">iiiiiiiiii</span><br/>
      <span id="x_s" style="border:solid 1px">XXXXXXXXXX</span><br/>
      </div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById('i_s').offsetWidth, document.getElementById('x_s').offsetWidth);
}

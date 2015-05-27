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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style id="style1">
          @media all and (min-color: 24) { .insane { color: green; } }
          @media all and (min-color: 2) { .sane { color: green; } }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p> https://bugs.webkit.org/show_bug.cgi?id=20289 </p>
      Sanity check screenDepthPerComponent to ensure it is returning the number of bits per color rather than the screen depth (e.g. 24).
      <div class="insane" id="result">Should be rgb(0, 0, 0): </div>
      <div class="sane" id="result2">Should be rgb(0, 128, 0): </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementById('result')).getPropertyValue("color"), 'rgb(0, 0, 0)');
  shouldBe(getComputedStyle(document.getElementById('result2')).getPropertyValue("color"), 'rgb(0, 128, 0)');
}

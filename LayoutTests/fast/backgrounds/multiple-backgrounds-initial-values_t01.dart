/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that background position values do not leak between layers
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .test {
          background: url($root/resources/dot.png) no-repeat -10px 50px,
              linear-gradient(to bottom, green 0%, lime 100%);
          width: 100px;
          height: 100px;
          visibility: hidden;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var e = document.querySelector('.test');

  var bgPosLayers = e.getComputedStyle().backgroundPosition.split(', ');

  var bgPosLayer1 = bgPosLayers[0];
  shouldBeGreaterThanOrEqual(bgPosLayers[0].indexOf("-10px"), 0);
  shouldBeGreaterThanOrEqual(bgPosLayers[0].indexOf("50px"), 0);

  var bgPosLayer2 = bgPosLayers[1];
  shouldBe(bgPosLayers[1].indexOf("-10px"), -1);
  shouldBe(bgPosLayers[1].indexOf("50px"), -1);
}


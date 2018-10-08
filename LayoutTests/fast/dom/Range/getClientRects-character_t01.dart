/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    .box {
        line-height: 30px;
        font-family: monospace;
        font-size: 20px;
    }

    .horizontal {
        width: 400px;
    }

    .vertical {
        height: 400px;
        -webkit-writing-mode: vertical-rl;
    }

    #console {
        position:absolute;
        left: 500px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="console"></div>
    <div class="box horizontal" id="test-horizontal">ABCDEFGHIJKLMNOPQRSTUVWXYZ ABCDEFGHIJKLMNOPQRSTUVWXYZ</div>
    <div class="box vertical" id="test-vertical">ABCDEFGHIJKLMNOPQRSTUVWXYZ ABCDEFGHIJKLMNOPQRSTUVWXYZ</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug("Test horizontal");
  var range = document.createRange();

  var box = document.getElementById('test-horizontal');
  range.setStart(box.firstChild, 20);
  range.setEnd(box.firstChild, 21);
  var rects = range.getClientRects();
  shouldBe(rects.length, 1);
  shouldBeGreaterThanOrEqual(box.offsetWidth / 26, rects[0].width);
  shouldBeGreaterThanOrEqual(box.offsetHeight / 2, rects[0].height);

  debug("Test vertical");
  box = document.getElementById('test-vertical');
  range.setStart(box.firstChild, 20);
  range.setEnd(box.firstChild, 21);
  rects = range.getClientRects();
  shouldBe(rects.length, 1);
  shouldBeGreaterThanOrEqual(box.offsetWidth / 2, rects[0].width);
  shouldBeGreaterThanOrEqual(box.offsetHeight / 26, rects[0].height);
}

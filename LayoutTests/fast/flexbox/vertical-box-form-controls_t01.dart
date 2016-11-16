/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if form controls in vertical flex box will stretch
 * horizontally when rendered as box as opposed to inline-box.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <style>
      div.box {
        display: -moz-box;
        display: -webkit-box;
        display: box;
      }

      div.outer {
        width: 100px;
        height: 100px;
        background-color: red;
        box-orient: vertical;
        -moz-box-orient: vertical;
        -webkit-box-orient: vertical;
      }

      .inner {
        display: -webkit-box;
        display: -moz-box;
        display: box;
        box-align: stretch;
        -moz-box-align: stretch;
        -webkit-box-align: stretch;
        margin: 0;
        border: 0;
        padding: 0;
        height: 100px;
        background-color: green;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="box outer">
      <button class="inner" type="submit" id="button"></button>
      </div>
      <div class="box outer">
      <input class="inner" type="text" value="" id="inputText">
      </div>
      <div class="box outer">
      <textarea class="inner" id="textarea"></textarea>
      </div>
      <div class="box outer">
      <input class="inner" type="submit" value="" id="submit">
      </div>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var element = null;

  debug("Button");
  element = document.getElementById("button");
  shouldBe(element.offsetHeight, 100);
  shouldBe(element.offsetWidth, 100);

  debug("Text input");
  element = document.getElementById("inputText");
  shouldBe(element.offsetHeight, 100);
  shouldBe(element.offsetWidth, 100);

  debug("Textarea");
  element = document.getElementById("textarea");
  shouldBe(element.offsetHeight, 100);
  shouldBe(element.offsetWidth, 100);

  debug("Submit");
  element = document.getElementById("submit");
  shouldBe(element.offsetHeight, 100);
  shouldBe(element.offsetWidth, 100);
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if box-orient is working in <button>. 
 * See https://bugs.webkit.org/show_bug.cgi?id=25406
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var f = new DocumentFragment.html('''
      <style type="text/css">
      .box {
        display: -webkit-flex;
        display: flex;
      }
      .horizontal {
        -webkit-flex-direction: row;
        flex-direction: horizontal;
      }
      .vertical {
        -webkit-flex-direction: column;
        flex-direction: column;
      }
      .box span {
        display: -webkit-flex;
        display: flex;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="main">
      <p>
      reference of horizontal button:<br>
      <button id="reference_horizontal">
        <span>hello</span>
        <span>world</span>
      </button>
      <p>
      reference of vertical button:<br>
      <button id="reference_vertical">
        <span>hello</span><br>
        <span>world</span>
      </button>
      <p>
      default:<br>
      <button id="default" class="box">
        <span>hello</span>
        <span>world</span>
      </button>
      <p>
      horizontal:<br>
      <button id="horizontal" class="box horizontal">
        <span>hello</span>
        <span>world</span>
      </button>
      <p>
      vertical:<br>
      <button id="vertical" class="box vertical">
        <span>hello</span>
        <span>world</span>
      </button>
      <p>
      default => vertical:<br>
      <button id="toVertical" class="box">
        <span>hello</span>
        <span>world</span>
      </button>
      <p>
      vertical => horizontal:<br>
      <button id="toHorizontal" class="box vertical">
        <span>hello</span>
        <span>world</span>
      </button>
      </div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  setFlexDirection(element, flexDirection) {
    element.style.flexDirection = flexDirection;
  }

  gebi(id) {
    return document.getElementById(id);
  }

  setFlexDirection(gebi("toVertical"), "column");
  setFlexDirection(gebi("toHorizontal"), "row");

  var referenceHorizontalHeight = gebi("reference_horizontal").clientHeight;
  var referenceVerticalHeight = gebi("reference_vertical").clientHeight;
  shouldBe(gebi('default').clientHeight, referenceHorizontalHeight);
  shouldBe(gebi('horizontal').clientHeight, referenceHorizontalHeight);
  shouldBe(gebi('vertical').clientHeight, referenceVerticalHeight);
  shouldBe(gebi('toHorizontal').clientHeight, referenceHorizontalHeight);
  shouldBe(gebi('toVertical').clientHeight, referenceVerticalHeight);
}

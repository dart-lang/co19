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
      <div id="sheet-container"></div>
      <div><!-- Extra divs so it's clear when we're doing a full document recalc -->
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
      </div>
      <div class="foo">foo</div>
      <div class="foo">foo</div>
      <div class="foo">foo</div>
      <div class="bar">bar</div>
      <div class="bar">bar</div>
      <div class="bar">bar</div>
      <div class="baz">baz</div>
      <div class="baz">baz</div>
      <div class="baz">baz</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Add and remove sheets in the same run.
  document.documentElement.offsetTop;
  var sheetContainer = document.getElementById('sheet-container');
  sheetContainer.setInnerHtml('<style>.foo { color: green; }</style><style>.bar { color: red; }</style>',
      treeSanitizer: new NullTreeSanitizer());

  document.documentElement.offsetTop;
  sheetContainer.setInnerHtml('<style>.baz { color: blue; }</style>',
      treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.querySelector('.foo').getComputedStyle().color, 'rgb(0, 0, 0)');
  shouldBe(document.querySelector('.baz').getComputedStyle().color, 'rgb(0, 0, 255)');
  shouldBe(document.querySelector('.bar').getComputedStyle().color, 'rgb(0, 0, 0)');
}

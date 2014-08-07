/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that a style recalc on the inner element after the outer
 * one works correctly. See also crbug.com/346928.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
        div { width: 100px }
        div:-webkit-any(.outer) { width: 200px }
        div:-webkit-any(.inner) { width: 300px }
        div:-webkit-any(.inner2) { width: 150px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="outer">
        <div id="mid">
          <div id="inner">
          </div>
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var outer = document.getElementById('outer');
  var inner = document.getElementById('inner');

  outer.offsetHeight;

  outer.className = 'outer';
  inner.className = 'inner';

  shouldBe(getComputedStyle(outer).width, '200px');

  inner.className = 'inner2';
  shouldBe(getComputedStyle(inner).width, '150px');
}

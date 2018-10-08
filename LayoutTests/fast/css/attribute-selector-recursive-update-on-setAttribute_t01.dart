/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that attribute selectors are recursively
 * re-evaluated when the attribute changes.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .entry[status="foo"] .toggle {
          color: green;
      }
      .entry[status="bar"] .toggle {
          color: red;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="entry" status="foo">
          <span class="toggle">Text.</span>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic entry= document.getElementsByClassName("entry")[0];
  dynamic toggle = document.getElementsByClassName("toggle")[0];

  shouldBe(toggle.getComputedStyle().color, 'rgb(0, 128, 0)');
  entry.setAttribute("status", "bar");
  shouldBe(toggle.getComputedStyle().color, 'rgb(255, 0, 0)');

  entry.remove();
}

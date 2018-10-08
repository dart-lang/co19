/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that adding a class then synchronously adding a style
 * sheet produces correct styles. See also crbug.com/346873
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var f = new DocumentFragment.html('''
      <style id="s1">span { color: red}</style>
      <style id="s2">span { color: red}</style>

      <style>
        div { width: 100px }
        .class { width: 200px }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div id="target">
      <div id="other">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("target");
  target.offsetHeight;

  // Set the class, which should schedule an async style recalc to change width to 200px.
  target.className = 'class';

  var styleElement = document.createElement("style");
  styleElement.text = '#useless {width: 300px}';
  // Insert before style sheet s2 in order to trigger style resolver reconstruction.
  document.getElementById('s2').insertBefore(styleElement, null);

  shouldBe(getComputedStyle(target).width, "200px");
}

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
  var style = new Element.html('''
      <style>
      .absolutePosition { position: fixed; }
      .float:before { float: right; content: ''; }
      .float:first-letter { float: right; }
      .inline::first-letter { content: ''; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      WebKit Bug 85759 - Crash in RenderBlock::updateFirstLetterStyle.
      <div class="float" id="parent">
      <div class="absolutePosition" id="child"></div>
      PASS if test does not crash.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  var parent = document.getElementById("parent");
  var child = document.getElementById("child");
  child.setAttribute('class', 'inline');
  document.body.offsetTop;
  child.remove();
  document.body.offsetTop;
  parent.setAttribute('class', 'inline');
}

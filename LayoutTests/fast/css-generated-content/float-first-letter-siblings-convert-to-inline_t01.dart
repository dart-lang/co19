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
      .inlineFL::first-letter { overflow: visible; }
      .absolutePosition { position: absolute; }
      .floatFL:first-letter { float: right; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="parent" class="floatFL">
        <div id="child" class="absolutePosition"></div>
        PASS if no crash or assert
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  recreateFirstLetterBlock() {
    document.getElementById("parent").setAttribute('class', 'inlineFL');
    asyncEnd();
  }

  removeDiv() {
    // This causes the parent to only have inline (and floating) children
    document.getElementById("child").remove();
    setTimeout(recreateFirstLetterBlock, 10);
  }

  changeDivStyle() {
    document.getElementById("child").setAttribute('class', 'inlineFL');
    setTimeout(removeDiv(), 10);
  }

  startTest() {
    setTimeout(changeDivStyle(), 10);
  }

  asyncStart();
  startTest();
}

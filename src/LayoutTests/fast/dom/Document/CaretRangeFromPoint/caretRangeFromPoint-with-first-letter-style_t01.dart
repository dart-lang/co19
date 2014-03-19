/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description caretRangeFromPoint() should work with :first-letter style
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    p.first-letter:first-letter { color: red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
    
  document.body.setInnerHtml('''
    <div id="container">
    <p id="sample" class="first-letter"><span>0123456</span></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  $(id) { return document.getElementById(id); }

  var middle = $('sample').offsetTop + $('sample').offsetHeight / 2;
  var left = $('sample').offsetLeft;
  var numberOfChars = $('sample').firstChild.firstChild.length;
  var charWidth = $('sample').firstChild.offsetWidth / numberOfChars;
  var x = left;

  for (var i = 0; i < numberOfChars; ++i) {
    var range = document.caretRangeFromPoint((x + 3).round(), middle.round());
    Expect.equals(i, range.startOffset);
    x += charWidth;
  }
}

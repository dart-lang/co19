/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the matched declaration cache handles explicitly
 * inherited properties correctly.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .a { margin-left:5px; }
      .b { margin-left:inherit; }
      .c { margin-left:10px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class=a>
          <div class="" id=test1a></div>
      </div>
      <div>
          <div class=a>
              <div class="" id=test1b></div>
          </div>
      </div>
      <div class=a>
          <div class="b" id=test2a></div>
      </div>
      <div>
          <div class=a>
              <div class="b" id=test2b></div>
          </div>
      </div>
      <div class=a>
          <div class="b c" id=test3a></div>
      </div>
      <div>
          <div class=a>
              <div class="b c" id=test3b></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(e, p) {
    var testDiv = document.getElementById(e);
    var cssValue = getComputedStyle(testDiv).getPropertyValue(p);
    return cssValue;
  }

  shouldBeEqualToString(test('test1a', 'margin-left'), "0px");
  shouldBeEqualToString(test('test1b', 'margin-left'), "0px");
  shouldBeEqualToString(test('test2a', 'margin-left'), "5px");
  shouldBeEqualToString(test('test2b', 'margin-left'), "5px");
  shouldBeEqualToString(test('test3a', 'margin-left'), "10px");
  shouldBeEqualToString(test('test3b', 'margin-left'), "10px");
}

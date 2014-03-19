/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
        #test {
            width: 400px;
            font-family: "Ahem";
        }
    </style>''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div id="test">xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx</div>''',
    treeSanitizer: new NullTreeSanitizer());

  test(name, x, y, expectedContainer, expectedOffset)
  {
    x = x.round();
    y = y.round();
    try {
      var range = document.caretRangeFromPoint(x, y);
      Expect.equals(expectedContainer, range.startContainer);
      Expect.equals(expectedOffset, range.startOffset);
    } catch (e) {
      Expect.fail('$name: $e');
    }
  }

  shouldBeNull(x, y)
  {
    var range = document.caretRangeFromPoint(x, y);
    Expect.isNull(range);
  }

  var element = document.getElementById('test');
  var text = element.firstChild;

  var rect = element.getBoundingClientRect();

  test("Testing upper left", rect.left, rect.top, element.firstChild, 0);

  test("Testing upper right", rect.left + rect.width, rect.top, element.firstChild, 23);

  test("Testing lower left", rect.left, rect.top + rect.height - 1, element.firstChild, 72);

  test("Testing lower right", rect.left + rect.width, rect.top + rect.height - 1, element.firstChild, 95);

  test("Testing somewhere in the middle", (rect.left + rect.width) / 2, (rect.top + rect.height) / 2, element.firstChild, 36);

  //log("Testing negative values");
  shouldBeNull(-10, 10);
  shouldBeNull(10, -10);
  shouldBeNull(-10, -10);

  //log("Testing values larger than the viewport");
  shouldBeNull(window.innerWidth + 100, 10);
  shouldBeNull(10, window.innerHeight + 100);
  shouldBeNull(window.innerWidth + 100, window.innerHeight + 100);
}

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
import "pwd.dart";

main() {
  var style = new Element.html('''
    <style>
        #test {
            width: 400px;
            font-family: "Ahem";
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
<div id="test">xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx<img id="image" src="$root/../../resources/abe.png">xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx</div>
''', treeSanitizer: new NullTreeSanitizer());

  caretRangeFromPoint(x, y)
    => document.caretRangeFromPoint(x.round(), y.round());

  test(name, x, y, expectedContainer, expectedOffset)
  {
    try {
      var range = caretRangeFromPoint(x, y);

      Expect.equals(expectedContainer, range.startContainer,
          'range.startContainer');

      Expect.equals(expectedOffset, range.startOffset,
          'range.startOffset');
    } catch (e) {
      Expect.fail('$name: $e');
    }
  }

  var image = document.getElementById('image');

  var imageRect = image.getBoundingClientRect();

  test("Testing left of the image",
      imageRect.left - 10,
      (imageRect.top + imageRect.height) - 5,
      //image.previousSibling, 34);
      image.previousNode, 34);

  test("Testing right of the image",
      (imageRect.left + imageRect.width) + 10,
      (imageRect.top + imageRect.height) - 5,
      //image.nextSibling, 1);
      image.nextNode, 1);

  test("Testing on the image",
      (imageRect.left + (imageRect.width / 2) + 1),
      (imageRect.top + imageRect.height) - 5,
      image.parentNode,
      2);
}

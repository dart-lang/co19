/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test"><div><a href="#">link</a></div><div></div><div><br><br><img src="" id="img-tag"></div><div><br><br>text</div></div>
    <div id="expectations">
        <div id="test_right_complex_subtree"><div><a href="#">link</a></div><div></div><div><br><br></div></div>
        <div id="test_left_complex_subtree"><div></div><div><br><br>text</div></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  markup(x) => x.innerHtml;

  testCloneContents(description, range, expectedContentsId) {
    debug(description);
    var actualContents = range.cloneContents();
    var expectedContents = document.getElementById(expectedContentsId);
    shouldBe(markup(actualContents), markup(expectedContents));
  }

  var test = document.getElementById('test');

  var range = document.createRange();

  range.setStartBefore(test.firstChild);
  var imgTag = document.getElementById('img-tag');
  range.setEndBefore(imgTag);

  testCloneContents('Cloning right complex subtree', range, 'test_right_complex_subtree');

  range.setStartAfter(imgTag);
  range.setEndAfter(test.lastChild);

  testCloneContents('Cloning left complex subtree', range, 'test_left_complex_subtree');
}

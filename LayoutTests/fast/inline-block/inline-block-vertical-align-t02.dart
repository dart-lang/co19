/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description inline-block + vertical-align
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
  <style type="text/css">
#outer {
    border: 1px solid blue;
}
#inner {
    display: inline-block;
    vertical-align: text-bottom;
    border: 1px solid green;
}
  </style>
''';

const String htmlEL2 = r'''
    <p>The bottom line of the green box should be above the bottom line of the blue box.</p>
    <p>
      <span id="outer">
        [Text]
        <span id="inner">
          [Inline Block]
        </span>
      </span>
    </p>
    <p id="result"></p>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var result = document.getElementById('result');
    var outer = document.getElementById('outer');
    var inner = document.getElementById('inner');
    var outerBottom = outer.offsetTop + outer.offsetHeight;
    var innerBottom = inner.offsetTop + inner.offsetHeight;
    Expect.isTrue(outerBottom >= innerBottom, 'outerBottom = $outerBottom, innerBottom = $innerBottom ');
    result.text="PASS";
}

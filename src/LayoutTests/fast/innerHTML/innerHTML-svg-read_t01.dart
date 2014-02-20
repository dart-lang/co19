/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that accessing innerHTML and outerHTML properties works on SVG elements
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
<div style="visibility:hidden">
  <svg id="emptysvg"></svg>
  <svg id="rectsvg"><rect/></svg>
  <svg id="foreign" width="100" height="30"><foreignObject width="100" height="30"><p>html</p></foreignObject></svg>
</div>''', treeSanitizer: new NullTreeSanitizer());

  function innerHTML(id) {
    return document.getElementById(id).innerHtml;
  }

  function outerHTML(id) {
    return document.getElementById(id).outerHtml;
  }

  var tests = [
    [innerHTML("emptysvg")  , ''],
    [innerHTML("rectsvg")  , '<rect></rect>' ],
    [innerHTML("foreign")  , '<foreignObject width="100" height="30"><p>html</p></foreignObject>' ],
    [outerHTML("emptysvg")  , '<svg id="emptysvg"></svg>'],
    [outerHTML("rectsvg")  , '<svg id="rectsvg"><rect></rect></svg>' ],
    ];

  checkList(list) {
    for (var elem in list) {
      Expect.equals(elem[1], elem[0]);
    }
  }

  checkList(tests);
}


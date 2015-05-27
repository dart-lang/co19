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
    <p>
        <span>
            <span id="start"></span>
        </span>
    </p>
    <p>
        <span>
            <span id="end"></span>
        </span>
    </p>
    ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_)
  {
    document.removeEventListener("DOMSubtreeModified", runTest, false);
    document.body.innerHtml = 'PASS: does not crash';
  }

  document.addEventListener("DOMSubtreeModified", runTest, false);

  var r = document.createRange();
  r.setStartBefore(document.getElementById('start'));
  r.setEndAfter(document.getElementById('end'));
  r.extractContents();
}

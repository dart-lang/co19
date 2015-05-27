/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test passed if it did not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          This is a test for <i><a href="rdar://problem/5872671">rdar://problem/5872671</a> REGRESSION (3.1.1-TOT): Repro crash going to Ortega Park home page</i>.
      </p>
      <p>
          The test passed if it did not crash.
      </p>
      <div>
          <span style='padding: 1px;'>
              <div></div>
          </span>
          <br>
          <img id="target">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  document.getElementById("target").style.height = "100px";
}

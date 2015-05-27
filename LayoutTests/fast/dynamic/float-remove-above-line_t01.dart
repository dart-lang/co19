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
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=18722">https://bugs.webkit.org/show_bug.cgi?id=18722</a>
          Webkit Nightly Build crashes when visiting i has a hotdog</i>.
      </p>
      <p>
          The test passes if it does not crash.
      </p>
      <div>
          foo<br>bar
          <div id="float" style="float: right; height: 10px; width: 10px; background-color: lightblue; margin-top: -10px;"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  document.getElementById("float").style.display = "none";
}


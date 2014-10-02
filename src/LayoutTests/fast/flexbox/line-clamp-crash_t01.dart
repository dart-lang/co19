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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test that an incremental layout of a block with line-clamp truncation does not trigger a crash.
      </p>
      <div style="-webkit-box-orient: vertical; -webkit-line-clamp: 5; display: -webkit-box;">
          <div>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <span id="target">Running </span>
              <a href="#">X</a>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var placeholder = document.getElementById("target");
    placeholder.remove();
  }

  document.body.offsetTop;
  test();
  document.body.offsetTop;
}

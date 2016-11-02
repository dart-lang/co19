/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=48019.
 * It is OK not to crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <progress value=50 max=100>
      <b>
        <menu>
          <select autofocus>
        </menu>
        <input>
      </b>
    </progress>
    ''', treeSanitizer: new NullTreeSanitizer());
}

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
      Test passes if it does not crash.
      <textarea id="A"></textarea>
      <textarea id="B"></textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  id(x) => document.getElementById(x);

  id('A').selectionStart = 0;
  id('B').style.display = "none";
  id('B').selectionStart = 0;
}

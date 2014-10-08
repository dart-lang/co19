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
      <p>"dirname" attribute</p>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var input = document.createElement('input');
  input.setAttribute('dirName', "Hello");
  shouldBeEqualToString(input.dirName, "Hello");

  var textArea = document.createElement('textarea');
  textArea.setAttribute('dirName', "Hello");
  shouldBeEqualToString(textArea.dirName, "Hello");
}

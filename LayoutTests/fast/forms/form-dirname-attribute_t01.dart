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
      <p>"dirname" attribute</p>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input = document.createElement('input') as InputElement;
  input.setAttribute('dirName', "Hello");
  shouldBeEqualToString(input.dirName, "Hello");

  TextAreaElement textArea = document.createElement('textarea') as TextAreaElement;
  textArea.setAttribute('dirName', "Hello");
  shouldBeEqualToString(textArea.dirName, "Hello");
}

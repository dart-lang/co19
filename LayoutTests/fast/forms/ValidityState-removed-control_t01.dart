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
      <p>Tests the behavior of removing a control and then accessing its validity state afterward.</p>

      <select id="control"></select>

      <p id="result">TEST DID NOT RUN YET</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select = document.getElementById("control");
  var validity = select.validity;
  document.getElementById("control").remove();
  gc();
  validity.valueMissing;
  Text text = document.getElementById("result").firstChild;
  //text.data = "Test has run: If no assertion or crash occurred, it passed.";
  text.data = "PASS";
}

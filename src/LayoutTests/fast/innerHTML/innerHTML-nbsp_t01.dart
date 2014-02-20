/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see if setting innerHTML to a single non-breaking space works
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
      <div id="test" style="display:none"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var html = "\u00A0";
  var testElement = document.getElementById("test");

  testElement.innerHtml = html;

  //Expect.equals(html, testElement.innerHtml);
  Expect.equals(html, testElement.text);
}


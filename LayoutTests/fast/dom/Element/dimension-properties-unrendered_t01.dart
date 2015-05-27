/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the scroll, client and offset dimension 
 * properties return "0" instead of undefined for an unrendered element.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="testDiv" style="display: none">x</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var testDiv = document.getElementById("testDiv");

  Expect.equals(0, testDiv.offsetLeft);
  Expect.equals(0, testDiv.offsetTop);
  Expect.equals(0, testDiv.offsetWidth);
  Expect.equals(0, testDiv.offsetHeight);
  Expect.equals(0, testDiv.clientWidth);
  Expect.equals(0, testDiv.clientHeight);
  Expect.equals(0, testDiv.scrollLeft);
  Expect.equals(0, testDiv.scrollTop);
  Expect.equals(0, testDiv.scrollWidth);
  Expect.equals(0, testDiv.scrollHeight);
}

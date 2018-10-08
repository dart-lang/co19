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
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=25379">bug 25379<a>:
      Selecting a bank in American Express Pay Bill fails.</p>
      <p>Both SELECT elements below should say PASS.</p>
      <select>
      <option selected>FAIL</option>
      <option selected>PASS</option>
      </select>
      <div id=paymentoptions></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("paymentoptions").innerHtml = 
    '<select>' +
    '<option selected>FAIL</option>' +
    '<option selected>PASS</option>' +
    '</select>';

  SelectElement select1 = document.getElementsByTagName("select")[0];
  SelectElement select2 = document.getElementsByTagName("select")[1];
  shouldBe(select1.value, 'PASS');
  shouldBe(select2.value, 'PASS');
}

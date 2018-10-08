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
  var f = new DocumentFragment.html('''
      <style>
       input, input#test:focus { background:lime }
       input#test, input:focus { background:red }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>The form controls below should have a green background:</p>
      <p><input id="test"/></p>
      <p><input autofocus="autofocus"/></p>
      <p><input autofocus="autofocus"/></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.querySelectorAll('input')[0].focus();

  shouldBe(document.activeElement, document.body.querySelectorAll('input')[0]);
}

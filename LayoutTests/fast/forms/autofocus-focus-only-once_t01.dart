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
      input { background:red }
      input:focus { background:lime }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <input id="input1" type="text" autofocus/>
      <br/>
      <p>This form control should have a green background and active state:<input id="input2"> 
      ''', treeSanitizer: new NullTreeSanitizer());

  elementBlur(_) {
    (document.getElementById("input1") as InputElement).type = "password";
    asyncEnd();
  }
  elementFocus(_) {
    (document.getElementById("input1") as InputElement).type = "text";
    asyncEnd();
  }
  document.getElementById("input1").onBlur.listen(elementBlur);
  document.getElementById("input1").onFocus.listen(elementFocus);
  
  asyncMultiStart(2);

  window.onLoad.listen((_) {
    document.getElementById("input2").focus();
    shouldBe(document.activeElement, document.getElementById("input2"));
  });
}

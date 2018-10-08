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
       input { background:lime }
       input:focus { background:red }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>The form control below should have a green background:
      <p><input autofocus>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gotBlur = false;

  switchBlur(_) {
    gotBlur = true;
  }

  test() {
    shouldBeTrue(gotBlur);
    asyncEnd();
  }

  var input = document.body.querySelector('input');

  input.onFocus.listen((_) {
    input.blur();
    test();
  });
  input.onBlur.listen(switchBlur);

  asyncStart();
}

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
  DocumentFragment f = new DocumentFragment.html('''
      <style>
       input { background:red }
       input:focus { background:lime }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>The form control should have a green background: <input/></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  check([_]) {
    shouldBe(document.activeElement, document.body.querySelector("input"));
    asyncEnd();
  }

  test() {
    Element input = document.body.querySelector('input');
    Element p = document.body.querySelector('p');
    input = input..remove();
    (input as InputElement).autofocus = true;
    input.addEventListener('focus', check, false);
    p.append(input);
    setTimeout(check, 1000);
  }

  asyncStart();
  test();
}
    

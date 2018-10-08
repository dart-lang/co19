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
      <p>
      This page is a test case for <a href="https://bugs.webkit.org/show_bug.cgi?id=51905">Bug 51905</a>. WebKit should not crash when this page is loaded.
      </p>
      PASS
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement element = document.createElement('input') as InputElement;

  delay() {
    element.remove();
    gc();
    FormElement form = document.createElement('form') as FormElement;
    form.setAttribute('id', 'form2');
    document.body.append(form);
    asyncEnd();
  }

  test() {
    element.setAttribute('form', 'form1');
    document.body.append(element);
    element.attributes.remove('form');
    setTimeout(delay, 0);
  }

  asyncStart();
  test();
}

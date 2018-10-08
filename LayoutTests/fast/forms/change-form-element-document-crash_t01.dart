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
      This page is a test case for <a href="https://bugs.webkit.org/show_bug.cgi?id=51418">Bug 51418</a>. WebKit should not crash when this page is loaded.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  crash_test(element_name) {
    var element = document.createElement(element_name);
    element.setAttribute('form', '1');
    var container = document.createElement('div');
    container.append(element);
    //document.implementation.createDocument(null, '').adoptNode(container);
    //delete element;
    document.implementation.createDocument('', '', null).adoptNode(container);
    element = null;
    gc();
    var form = document.createElement('form');
    form.setAttribute('id', '2');
    document.body.append(form);
  }

  crash_test('input');
  crash_test('object');
  document.body.innerHtml = "PASS";
}

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
      <p>Test method and formmethod attributes</p>

      <form id=f1></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  FormElement form1 = document.getElementById('f1') as FormElement;

  debug('Missing value default:');
  shouldBe(form1.method, "get");
  shouldBeNull(form1.getAttribute("method"));

  debug('');
  debug('Invalid value default:');
  form1.method = " post "; shouldBe(form1.method, "get");
  shouldBe(form1.getAttribute("method"), " post ");
  form1.setAttribute("method", "put"); shouldBe(form1.method, "get");

  debug('');
  debug('Valid values:');
  form1.method = "Post"; shouldBe(form1.method, "post");
  shouldBe(form1.getAttribute("method"), "Post");

  form1.method = "Get"; shouldBe(form1.method, "get");
  shouldBe(form1.getAttribute("method"), "Get");
}

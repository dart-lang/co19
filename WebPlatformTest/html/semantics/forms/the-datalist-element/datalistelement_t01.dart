/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/forms/the-datalist-element/datalistelement.html
 * @assertion
 *     <link href="http://www.w3.org/TR/html5/forms.html#the-datalist-element" rel="help">
 * @description datalist element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <datalist id="datalist1" style="display: none">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
    </datalist>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  test(() {
    assert_true(document.getElementsByTagName("datalist")[0] is DataListElement);
  }, "DataListElement support");
  
  test(() {
    assert_equals(document.getElementsByTagName("datalist")[0].options.item(0), document.getElementsByTagName("option")[0]);
  }, "DataListElement options item collection support");
  
  checkTestFailures();
}

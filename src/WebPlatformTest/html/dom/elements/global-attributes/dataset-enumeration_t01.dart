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
 * after web-platform-tests/html/dom/elements/global-attributes/classlist-enumeration.html
 * @assertion 
 * @description Dataset - Enumeration
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      void testEnumeration(array) {
        var d = document.createElement("div");
        for (var i = 0; i < array.length; ++i) {
          d.setAttribute(array[i], "value");
        }
        return d.dataset.length;
      }

      test(() { assert_equals(testEnumeration(['data-foo', 'data-bar', 'data-baz']), 3); },
        "A dataset should be enumeratable.");
      test(() { assert_equals(testEnumeration(['data-foo', 'data-bar', 'dataFoo']), 2); },
        "Only attributes who qualify as dataset properties should be enumeratable in the dataset.");

      checkTestFailures();
}

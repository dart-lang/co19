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
 * after web-platform-tests/html/dom/elements/global-attributes/classlist-nonstring.html
 * @assertion 
 * @description Dataset - Delete
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
      bool testDelete(attr, prop) {
        var d = document.createElement("div");
        d.setAttribute(attr, "value");
        d.dataset.remove(prop);
        return d.attributes.containsKey(attr) == false && d.getAttribute(attr) != "value";
      }

      bool testDeleteNoAdd(prop) {
        var d = document.createElement("div");
        d.dataset.remove(prop);
        return true;
      }

      test(() { assert_true(testDelete('data-foo', 'foo')); },
        "Deleting element.dataset['foo'] should also remove an attribute with name 'data-foo' should it exist.");
      test(() { assert_true(testDelete('data-foo-bar', 'fooBar')); },
        "Deleting element.dataset['fooBar'] should also remove an attribute with name 'data-foo-bar' should it exist.");
      test(() { assert_true(testDelete('data--', '-')); },
        "Deleting element.dataset['-'] should also remove an attribute with name 'data--' should it exist.");
      test(() { assert_true(testDelete('data--foo', 'Foo')); },
        "Deleting element.dataset['Foo'] should also remove an attribute with name 'data--foo' should it exist.");
      test(() { assert_true(testDeleteNoAdd('data--foo')); },
        "Deleting element.dataset['-foo'] should also remove an attribute with name 'data--foo' should it exist.");
      test(() { assert_true(testDelete('data---foo', '-Foo')); },
        "Deleting element.dataset['-Foo'] should also remove an attribute with name 'data---foo' should it exist.");
      test(() { assert_true(testDelete('data-', '')); },
        "Deleting element.dataset[''] should also remove an attribute with name 'data-' should it exist.");
      test(() { assert_true(testDelete('data-\xE0', '\xE0')); },
        "Deleting element.dataset['\xE0'] should also remove an attribute with name 'data-\xE0' should it exist.");
      test(() { assert_true(testDeleteNoAdd('foo')); },
        "Deleting element.dataset['foo'] should not throw if even if the element does now have an attribute with the name data-foo.");
      checkTestFailures();
}

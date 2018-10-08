/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ElementList querySelectorAll(String selectors)
 * Finds all descendent elements of this element that match the specified
 * group of selectors.
 *
 * selectors should be a string using CSS selector syntax.
 * @description Checks various selectors (not exhaustive)
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var html = '';
  for (var x in [1, 2]) {
    html = '<div>'
        '<span>'
        '''<hr><pre
                           id="myid"
                           class="foo bar"
                           lang="en">'''
        '$html' // include itself
        '</pre>'
        '</span>'
        '</div>';
  }

  var e = new Element.html(html, treeSanitizer: new NullTreeSanitizer());
  document.body.append(e);

  testTrue(list, testName) {
    Expect.equals(2, list.length, testName);
    Expect.isTrue(list[0] is PreElement, '$testName arg0');
    Expect.isTrue(list[1] is PreElement, '$testName arg1');
  }

  testFalse(list, testName) {
    Expect.listEquals([], list, testName);
  }

  testTrue(document.querySelectorAll('pre'), 'Type selector');

  testFalse(document.querySelectorAll('table'), 'Type selector, negative');

  testTrue(
      document.querySelectorAll('span pre'), 'Descendant selector, direct');

  testTrue(
      document.querySelectorAll('div pre'), 'Descendant selector, indirect');

  testTrue(document.querySelectorAll('* pre'), 'Descendant selector, any');

  testTrue(document.querySelectorAll('span > pre'), 'Child selector');

  testFalse(document.querySelectorAll('div > pre'), 'Child selector, negative');

  testFalse(document.querySelectorAll('pre:first-child'),
      'The :first-child pseudo-class');

  testTrue(
      document.querySelectorAll('pre:lang(en)'), 'The :lang() pseudo-class');

  testFalse(
      document.querySelectorAll('pre:lang(fr)'), 'The :lang() pseudo-class');

  testTrue(document.querySelectorAll('hr + pre'), 'Adjacent selector');

  testFalse(
      document.querySelectorAll('div + pre'), 'Adjacent selector, negative');

  testTrue(document.querySelectorAll('pre[id]'), 'Attribute selector 1');

  testFalse(
      document.querySelectorAll('pre[foo]'), 'Attribute selector 1, negative');

  testTrue(document.querySelectorAll('pre[id="myid"]'), 'Attribute selector 2');

  testFalse(document.querySelectorAll('pre[id="myid2"]'),
      'Attribute selector 2, negative');

  testTrue(
      document.querySelectorAll('pre[class~="bar"]'), 'Attribute selector 3');

  testFalse(document.querySelectorAll('pre[class~="baz"]'),
      'Attribute selector 3, negative');

  testTrue(
      document.querySelectorAll('pre[lang|="en"]'), 'Attribute selector 4');

  testFalse(document.querySelectorAll('pre[lang|="fr"]'),
      'Attribute selector 4, negative');

  testTrue(document.querySelectorAll('pre.foo'), 'Class selector');

  testFalse(document.querySelectorAll('pre.baz'), 'Class selector, negative');

  testTrue(document.querySelectorAll('pre#myid'), 'Id selector');

  testFalse(document.querySelectorAll('pre#baz'), 'Id selector, negative');
}

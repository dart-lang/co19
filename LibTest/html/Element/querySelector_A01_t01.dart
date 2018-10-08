/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element querySelector(String selectors)
 * Finds the first descendant element of this element that matches the
 * specified group of selectors.
 *
 * selectors should be a string using CSS selector syntax.
 * @description Checks various selectors (not exhaustive)
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var e = new Element.html(
      '<div>'
      '<span>'
      '''<hr><pre
                                           id="myid"
                                           class="foo bar"
                                           lang="en">'''
      '</pre>'
      '</span>'
      '</div>',
      treeSanitizer: new NullTreeSanitizer());

  Expect.isTrue(e.querySelector('*') is SpanElement, 'Universal selector');

  Expect.isTrue(e.querySelector('pre') is PreElement, 'Type selector');

  Expect.isNull(e.querySelector('table'), 'Type selector, negative');

  Expect.isTrue(
      e.querySelector('span pre') is PreElement, 'Descendant selector, direct');

  Expect.isTrue(e.querySelector('div pre') is PreElement,
      'Descendant selector, indirect');

  Expect.isTrue(
      e.querySelector('* pre') is PreElement, 'Descendant selector, any');

  Expect.isTrue(e.querySelector('span > pre') is PreElement, 'Child selector');

  Expect.isNull(e.querySelector('div > pre'), 'Child selector, negative');

  Expect.isNull(
      e.querySelector('pre:first-child'), 'The :first-child pseudo-class');

  Expect.isTrue(e.querySelector('pre:lang(en)') is PreElement,
      'The :lang() pseudo-class');

  Expect.isNull(e.querySelector('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(e.querySelector('hr + pre') is PreElement, 'Adjacent selector');

  Expect.isNull(e.querySelector('div + pre'), 'Adjacent selector, negative');

  Expect.isTrue(
      e.querySelector('pre[id]') is PreElement, 'Attribute selector 1');

  Expect.isNull(e.querySelector('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(
      e.querySelector('pre[id="myid"]') is PreElement, 'Attribute selector 2');

  Expect.isNull(
      e.querySelector('pre[id="myid2"]'), 'Attribute selector 2, negative');

  Expect.isTrue(e.querySelector('pre[class~="bar"]') is PreElement,
      'Attribute selector 3');

  Expect.isNull(
      e.querySelector('pre[class~="baz"]'), 'Attribute selector 3, negative');

  Expect.isTrue(
      e.querySelector('pre[lang|="en"]') is PreElement, 'Attribute selector 4');

  Expect.isNull(
      e.querySelector('pre[lang|="fr"]'), 'Attribute selector 4, negative');

  Expect.isTrue(e.querySelector('pre.foo') is PreElement, 'Class selector');

  Expect.isNull(e.querySelector('pre.baz'), 'Class selector, negative');

  Expect.isTrue(e.querySelector('pre#myid') is PreElement, 'Id selector');

  Expect.isNull(e.querySelector('pre#baz'), 'Id selector, negative');
}

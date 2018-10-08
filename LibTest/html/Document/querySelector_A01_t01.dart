/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionElement querySelector(String selectors)
 * Finds the first descendant element of this document that matches the specified
 * group of selectors.
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

  document.body.append(e);

  Expect.isTrue(
      document.querySelector('*') is HtmlElement, 'Universal selector');

  Expect.isTrue(document.querySelector('pre') is PreElement, 'Type selector');

  Expect.isNull(document.querySelector('table'), 'Type selector, negative');

  Expect.isTrue(document.querySelector('span pre') is PreElement,
      'Descendant selector, direct');

  Expect.isTrue(document.querySelector('div pre') is PreElement,
      'Descendant selector, indirect');

  Expect.isTrue(document.querySelector('* pre') is PreElement,
      'Descendant selector, any');

  Expect.isTrue(
      document.querySelector('span > pre') is PreElement, 'Child selector');

  Expect.isNull(
      document.querySelector('div > pre'), 'Child selector, negative');

  Expect.isNull(document.querySelector('pre:first-child'),
      'The :first-child pseudo-class');

  Expect.isTrue(document.querySelector('pre:lang(en)') is PreElement,
      'The :lang() pseudo-class');

  Expect.isNull(
      document.querySelector('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(
      document.querySelector('hr + pre') is PreElement, 'Adjacent selector');

  Expect.isNull(
      document.querySelector('div + pre'), 'Adjacent selector, negative');

  Expect.isTrue(
      document.querySelector('pre[id]') is PreElement, 'Attribute selector 1');

  Expect.isNull(
      document.querySelector('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(document.querySelector('pre[id="myid"]') is PreElement,
      'Attribute selector 2');

  Expect.isNull(document.querySelector('pre[id="myid2"]'),
      'Attribute selector 2, negative');

  Expect.isTrue(document.querySelector('pre[class~="bar"]') is PreElement,
      'Attribute selector 3');

  Expect.isNull(document.querySelector('pre[class~="baz"]'),
      'Attribute selector 3, negative');

  Expect.isTrue(document.querySelector('pre[lang|="en"]') is PreElement,
      'Attribute selector 4');

  Expect.isNull(document.querySelector('pre[lang|="fr"]'),
      'Attribute selector 4, negative');

  Expect.isTrue(
      document.querySelector('pre.foo') is PreElement, 'Class selector');

  Expect.isNull(document.querySelector('pre.baz'), 'Class selector, negative');

  Expect.isTrue(
      document.querySelector('pre#myid') is PreElement, 'Id selector');

  Expect.isNull(document.querySelector('pre#baz'), 'Id selector, negative');
}

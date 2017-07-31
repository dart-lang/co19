/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element query(String relativeSelectors)
 * Alias for querySelector.
 * @description Checks various selectors (not exhaustive)
 * @note deprecated
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

  Expect.isTrue(e.query('*') is SpanElement, 'Universal selector');

  Expect.isTrue(e.query('pre') is PreElement, 'Type selector');

  Expect.isNull(e.query('table'), 'Type selector, negative');

  Expect.isTrue(
      e.query('span pre') is PreElement, 'Descendant selector, direct');

  Expect.isTrue(
      e.query('div pre') is PreElement, 'Descendant selector, indirect');

  Expect.isTrue(e.query('* pre') is PreElement, 'Descendant selector, any');

  Expect.isTrue(e.query('span > pre') is PreElement, 'Child selector');

  Expect.isNull(e.query('div > pre'), 'Child selector, negative');

  Expect.isNull(e.query('pre:first-child'), 'The :first-child pseudo-class');

  Expect.isTrue(
      e.query('pre:lang(en)') is PreElement, 'The :lang() pseudo-class');

  Expect.isNull(e.query('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(e.query('hr + pre') is PreElement, 'Adjacent selector');

  Expect.isNull(e.query('div + pre'), 'Adjacent selector, negative');

  Expect.isTrue(e.query('pre[id]') is PreElement, 'Attribute selector 1');

  Expect.isNull(e.query('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(
      e.query('pre[id="myid"]') is PreElement, 'Attribute selector 2');

  Expect.isNull(e.query('pre[id="myid2"]'), 'Attribute selector 2, negative');

  Expect.isTrue(
      e.query('pre[class~="bar"]') is PreElement, 'Attribute selector 3');

  Expect.isNull(e.query('pre[class~="baz"]'), 'Attribute selector 3, negative');

  Expect.isTrue(
      e.query('pre[lang|="en"]') is PreElement, 'Attribute selector 4');

  Expect.isNull(e.query('pre[lang|="fr"]'), 'Attribute selector 4, negative');

  Expect.isTrue(e.query('pre.foo') is PreElement, 'Class selector');

  Expect.isNull(e.query('pre.baz'), 'Class selector, negative');

  Expect.isTrue(e.query('pre#myid') is PreElement, 'Id selector');

  Expect.isNull(e.query('pre#baz'), 'Id selector, negative');
}

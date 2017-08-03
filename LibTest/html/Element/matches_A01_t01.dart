/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool matches(String selectors)
 * Checks if this element matches the CSS selectors.
 * @description Checks various selectors
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

  var x = e.querySelector('pre');

  Expect.isTrue(x.matches('*'), 'Universal selector');

  Expect.isTrue(x.matches('pre'), 'Type selector');

  Expect.isFalse(x.matches('table'), 'Type selector, negative');

  Expect.isTrue(x.matches('span pre'), 'Descendant selector, direct');

  Expect.isTrue(x.matches('div pre'), 'Descendant selector, indirect');

  Expect.isTrue(x.matches('* pre'), 'Descendant selector, any');

  Expect.isTrue(x.matches('span > pre'), 'Child selector');

  Expect.isFalse(x.matches('div > pre'), 'Child selector, negative');

  Expect.isFalse(x.matches('pre:first-child'), 'The :first-child pseudo-class');

  Expect.isTrue(x.matches('pre:lang(en)'), 'The :lang() pseudo-class');

  Expect.isFalse(x.matches('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(x.matches('hr + pre'), 'Adjacent selector');

  Expect.isFalse(x.matches('div + pre'), 'Adjacent selector, negative');

  Expect.isTrue(x.matches('pre[id]'), 'Attribute selector 1');

  Expect.isFalse(x.matches('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(x.matches('pre[id="myid"]'), 'Attribute selector 2');

  Expect.isFalse(
      x.matches('pre[id="myid2"]'), 'Attribute selector 2, negative');

  Expect.isTrue(x.matches('pre[class~="bar"]'), 'Attribute selector 3');

  Expect.isFalse(
      x.matches('pre[class~="baz"]'), 'Attribute selector 3, negative');

  Expect.isTrue(x.matches('pre[lang|="en"]'), 'Attribute selector 4');

  Expect.isFalse(
      x.matches('pre[lang|="fr"]'), 'Attribute selector 4, negative');

  Expect.isTrue(x.matches('pre.foo'), 'Class selector');

  Expect.isFalse(x.matches('pre.baz'), 'Class selector, negative');

  Expect.isTrue(x.matches('pre#myid'), 'Id selector');

  Expect.isFalse(x.matches('pre#baz'), 'Id selector, negative');
}

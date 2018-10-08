/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool matchesWithAncestors(String selectors)
 * Checks if this element or any of its parents match the CSS selectors.
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
      '<iframe></iframe>'
      '</pre>'
      '</span>'
      '</div>',
      treeSanitizer: new NullTreeSanitizer());

  IFrameElement x = e.querySelector('iframe');

  Expect.isTrue(x.matchesWithAncestors('*'), 'Universal selector');

  Expect.isTrue(x.matchesWithAncestors('pre'), 'Type selector');

  Expect.isFalse(x.matchesWithAncestors('table'), 'Type selector, negative');

  Expect.isTrue(
      x.matchesWithAncestors('span pre'), 'Descendant selector, direct');

  Expect.isTrue(
      x.matchesWithAncestors('div pre'), 'Descendant selector, indirect');

  Expect.isTrue(x.matchesWithAncestors('* pre'), 'Descendant selector, any');

  Expect.isTrue(x.matchesWithAncestors('span > pre'), 'iframe selector');

  Expect.isFalse(
      x.matchesWithAncestors('div > pre'), 'iframe selector, negative');

  Expect.isFalse(x.matchesWithAncestors('pre:first-child'),
      'The :first-child pseudo-class');

  Expect.isTrue(
      x.matchesWithAncestors('pre:lang(en)'), 'The :lang() pseudo-class');

  Expect.isFalse(
      x.matchesWithAncestors('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(x.matchesWithAncestors('hr + pre'), 'Adjacent selector');

  Expect.isFalse(
      x.matchesWithAncestors('div + pre'), 'Adjacent selector, negative');

  Expect.isTrue(x.matchesWithAncestors('pre[id]'), 'Attribute selector 1');

  Expect.isFalse(
      x.matchesWithAncestors('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(
      x.matchesWithAncestors('pre[id="myid"]'), 'Attribute selector 2');

  Expect.isFalse(x.matchesWithAncestors('pre[id="myid2"]'),
      'Attribute selector 2, negative');

  Expect.isTrue(
      x.matchesWithAncestors('pre[class~="bar"]'), 'Attribute selector 3');

  Expect.isFalse(x.matchesWithAncestors('pre[class~="baz"]'),
      'Attribute selector 3, negative');
}

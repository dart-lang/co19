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
      '''<hr><iframe
                                           id="myid"
                                           class="foo bar"
                                           lang="en">'''
      '</iframe>'
      '</span>'
      '</div>',
      treeSanitizer: new NullTreeSanitizer());

  var x = e.querySelector('iframe');

  Expect.isTrue(x.matches('*'), 'Universal selector');

  Expect.isTrue(x.matches('iframe'), 'Type selector');

  Expect.isFalse(x.matches('table'), 'Type selector, negative');

  Expect.isTrue(x.matches('span iframe'), 'Descendant selector, direct');

  Expect.isTrue(x.matches('div iframe'), 'Descendant selector, indirect');

  Expect.isTrue(x.matches('* iframe'), 'Descendant selector, any');

  Expect.isTrue(x.matches('span > iframe'), 'Child selector');

  Expect.isFalse(x.matches('div > iframe'), 'Child selector, negative');

  Expect.isFalse(
      x.matches('iframe:first-child'), 'The :first-child pseudo-class');

  Expect.isTrue(x.matches('iframe:lang(en)'), 'The :lang() pseudo-class');

  Expect.isFalse(x.matches('iframe:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isTrue(x.matches('hr + iframe'), 'Adjacent selector');

  Expect.isFalse(x.matches('div + iframe'), 'Adjacent selector, negative');

  Expect.isTrue(x.matches('iframe[id]'), 'Attribute selector 1');

  Expect.isFalse(x.matches('iframe[foo]'), 'Attribute selector 1, negative');

  Expect.isTrue(x.matches('iframe[id="myid"]'), 'Attribute selector 2');

  Expect.isFalse(
      x.matches('iframe[id="myid2"]'), 'Attribute selector 2, negative');

  Expect.isTrue(x.matches('iframe[class~="bar"]'), 'Attribute selector 3');

  Expect.isFalse(
      x.matches('iframe[class~="baz"]'), 'Attribute selector 3, negative');

  Expect.isTrue(x.matches('iframe[lang|="en"]'), 'Attribute selector 4');

  Expect.isFalse(
      x.matches('iframe[lang|="fr"]'), 'Attribute selector 4, negative');

  Expect.isTrue(x.matches('iframe.foo'), 'Class selector');

  Expect.isFalse(x.matches('iframe.baz'), 'Class selector, negative');

  Expect.isTrue(x.matches('iframe#myid'), 'Id selector');

  Expect.isFalse(x.matches('iframe#baz'), 'Id selector, negative');
}

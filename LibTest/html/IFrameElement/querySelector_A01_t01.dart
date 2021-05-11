// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Element querySelector(String selectors)
/// Finds the first descendant element of this element that matches the
/// specified group of selectors.
///
/// selectors should be a string using CSS selector syntax.
/// @description Checks that for IframeElement all queries return null
/// @issue #17456: all queries return null

// OtherResources=iframe.html
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {

  IFrameElement e = Element.html(
      '<iframe src="iframe.html"></iframe>',
      treeSanitizer: new NullTreeSanitizer()) as IFrameElement;
  document.body?.append(e);

  Expect.isNull(e.querySelector('*'), 'Universal selector');

  Expect.isNull(e.querySelector('pre'), 'Type selector');

  Expect.isNull(e.querySelector('table'), 'Type selector, negative');

  Expect.isNull(e.querySelector('span pre'), 'Descendant selector, direct');

  Expect.isNull(e.querySelector('div pre'), 'Descendant selector, indirect');

  Expect.isNull(e.querySelector('* pre'), 'Descendant selector, any');

  Expect.isNull(e.querySelector('span > pre'), 'Child selector');

  Expect.isNull(e.querySelector('div > pre'), 'Child selector, negative');

  Expect.isNull(
      e.querySelector('pre:first-child'), 'The :first-child pseudo-class');

  Expect.isNull(e.querySelector('pre:lang(en)'), 'The :lang() pseudo-class');

  Expect.isNull(e.querySelector('pre:lang(fr)'), 'The :lang() pseudo-class');

  Expect.isNull(e.querySelector('hr + pre'), 'Adjacent selector');

  Expect.isNull(e.querySelector('div + pre'), 'Adjacent selector, negative');

  Expect.isNull(e.querySelector('pre[id]'), 'Attribute selector 1');

  Expect.isNull(e.querySelector('pre[foo]'), 'Attribute selector 1, negative');

  Expect.isNull(e.querySelector('pre[id="myid"]'), 'Attribute selector 2');

  Expect.isNull(
      e.querySelector('pre[id="myid2"]'), 'Attribute selector 2, negative');

  Expect.isNull(e.querySelector('pre[class~="bar"]'), 'Attribute selector 3');

  Expect.isNull(
      e.querySelector('pre[class~="baz"]'), 'Attribute selector 3, negative');

  Expect.isNull(e.querySelector('pre[lang|="en"]'), 'Attribute selector 4');

  Expect.isNull(
      e.querySelector('pre[lang|="fr"]'), 'Attribute selector 4, negative');

  Expect.isNull(e.querySelector('pre.foo'), 'Class selector');

  Expect.isNull(e.querySelector('pre.baz'), 'Class selector, negative');

  Expect.isNull(e.querySelector('pre#myid'), 'Id selector');

  Expect.isNull(e.querySelector('pre#baz'), 'Id selector, negative');
}

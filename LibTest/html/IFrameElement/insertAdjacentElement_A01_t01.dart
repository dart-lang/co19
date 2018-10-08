/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Element insertAdjacentElement(String where, Element element)
 * Inserts element into the DOM at the specified location.
 * @description Checks insert for possible values of [where]
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var div, x;
  IFrameElement iframe;

  void init() {
    div = new Element.html('<div><iframe>Content</iframe></div>');
    iframe = div.firstChild;
    x = new PreElement();
  }

  init();
  iframe.insertAdjacentElement('beforeBegin', x);
  Expect.equals('<div><pre></pre><iframe>Content</iframe></div>', div.outerHtml,
      'beforeBegin');

  init();
  iframe.insertAdjacentElement('afterBegin', x);
  Expect.equals('<div><iframe><pre></pre>Content</iframe></div>', div.outerHtml,
      'afterBegin');

  init();
  iframe.insertAdjacentElement('beforeEnd', x);
  Expect.equals('<div><iframe>Content<pre></pre></iframe></div>', div.outerHtml,
      'beforeEnd');

  init();
  iframe.insertAdjacentElement('afterEnd', x);
  Expect.equals('<div><iframe>Content</iframe><pre></pre></div>', div.outerHtml,
      'afterEnd');
}

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
  var div, span, x;

  void init() {
    div = new Element.html('<div><span><h1></h1></span></div>');
    span = div.firstChild;
    x = new PreElement();
  }

  init();
  span.insertAdjacentElement('beforeBegin', x);
  Expect.equals('<div><pre></pre><span><h1></h1></span></div>', div.outerHtml,
      'beforeBegin');

  init();
  span.insertAdjacentElement('afterBegin', x);
  Expect.equals('<div><span><pre></pre><h1></h1></span></div>', div.outerHtml,
      'afterBegin');

  init();
  span.insertAdjacentElement('beforeEnd', x);
  Expect.equals('<div><span><h1></h1><pre></pre></span></div>', div.outerHtml,
      'beforeEnd');

  init();
  span.insertAdjacentElement('afterEnd', x);
  Expect.equals('<div><span><h1></h1></span><pre></pre></div>', div.outerHtml,
      'afterEnd');
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAdjacentHtml(String where, String html)
 * Parses text as an HTML fragment and inserts it into the DOM at the
 * specified location.
 * @description Checks insert for possible values of [where]
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var div, span, x;

  void init() {
    div = new Element.html('<div><span><h1></h1></span></div>');
    span = div.firstChild;
    x = '<pre>foo</pre>';
  }

  init();
  span.insertAdjacentHtml('beforeBegin', x);
  Expect.equals('<div><pre>foo</pre><span><h1></h1></span></div>',
      div.outerHtml, 'beforeBegin');

  init();
  span.insertAdjacentHtml('afterBegin', x);
  Expect.equals('<div><span><pre>foo</pre><h1></h1></span></div>',
      div.outerHtml, 'afterBegin');

  init();
  span.insertAdjacentHtml('beforeEnd', x);
  Expect.equals('<div><span><h1></h1><pre>foo</pre></span></div>',
      div.outerHtml, 'beforeEnd');

  init();
  span.insertAdjacentHtml('afterEnd', x);
  Expect.equals('<div><span><h1></h1></span><pre>foo</pre></div>',
      div.outerHtml, 'afterEnd');
}

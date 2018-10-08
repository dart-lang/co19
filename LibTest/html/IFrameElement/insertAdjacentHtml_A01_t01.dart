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
  var div, x;
  IFrameElement iframe;

  void init() {
    div = new Element.html('<div><iframe>Content1</iframe></div>');
    iframe = div.firstChild;
    x = 'Content2';
  }

  init();
  iframe.insertAdjacentHtml('beforeBegin', x);
  Expect.equals('<div>Content2<iframe>Content1</iframe></div>', div.outerHtml,
      'beforeBegin');

  init();
  iframe.insertAdjacentHtml('afterBegin', x);
  Expect.equals('<div><iframe>Content2Content1</iframe></div>', div.outerHtml,
      'afterBegin');

  init();
  iframe.insertAdjacentHtml('beforeEnd', x);
  Expect.equals('<div><iframe>Content1Content2</iframe></div>', div.outerHtml,
      'beforeEnd');

  init();
  iframe.insertAdjacentHtml('afterEnd', x);
  Expect.equals('<div><iframe>Content1</iframe>Content2</div>', div.outerHtml,
      'afterEnd');
}

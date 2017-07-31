/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAdjacentText(String where, String text)
 * Inserts text into the DOM at the specified location.
 * @description Checks insert for possible values of [where]
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var div, span, x;

  void init() {
    div = new Element.html('<div><span><h1></h1></span></div>');
    span = div.firstChild;
    x = 'text';
  }

  init();
  span.insertAdjacentText('beforeBegin', x);
  Expect.equals(
      '<div>text<span><h1></h1></span></div>', div.outerHtml, 'beforeBegin');

  init();
  span.insertAdjacentText('afterBegin', x);
  Expect.equals(
      '<div><span>text<h1></h1></span></div>', div.outerHtml, 'afterBegin');

  init();
  span.insertAdjacentText('beforeEnd', x);
  Expect.equals(
      '<div><span><h1></h1>text</span></div>', div.outerHtml, 'beforeEnd');

  init();
  span.insertAdjacentText('afterEnd', x);
  Expect.equals(
      '<div><span><h1></h1></span>text</div>', div.outerHtml, 'afterEnd');
}

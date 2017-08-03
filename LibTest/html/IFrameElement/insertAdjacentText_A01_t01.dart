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
  var div, x;
  IFrameElement iframe;

  void init() {
    div = new Element.html('<div><iframe>Content</iframe></div>');
    iframe = div.firstChild;
    x = 'text';
  }

  init();
  iframe.insertAdjacentText('beforeBegin', x);
  Expect.equals(
      '<div>text<iframe>Content</iframe></div>', div.outerHtml, 'beforeBegin');

  init();
  iframe.insertAdjacentText('afterBegin', x);
  Expect.equals(
      '<div><iframe>textContent</iframe></div>', div.outerHtml, 'afterBegin');

  init();
  iframe.insertAdjacentText('beforeEnd', x);
  Expect.equals(
      '<div><iframe>Contenttext</iframe></div>', div.outerHtml, 'beforeEnd');

  init();
  iframe.insertAdjacentText('afterEnd', x);
  Expect.equals(
      '<div><iframe>Content</iframe>text</div>', div.outerHtml, 'afterEnd');
}

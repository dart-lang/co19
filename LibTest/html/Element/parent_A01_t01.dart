/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element parent
 * The parent element of this node.
 * Returns null if this node either does not have a parent or its parent is
 * not an element.
 * @description Checks expected parent values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = document.body;
  x.innerHtml = '<div><span><span></div>';

  var html = document.querySelector('html');
  var body = document.querySelector('body');
  var div = document.querySelector('div');
  var span = document.querySelector('span');

  Expect.equals(div, span.parent);
  Expect.equals(x, div.parent);
  Expect.equals(html, x.parent);
  Expect.isNull(html.parent);
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node parentNode
 * The parent node of this node.
 * @description Checks expected parentNode values
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

  Expect.equals(div, span.parentNode);
  Expect.equals(x, div.parentNode);
  Expect.equals(html, x.parentNode);
  Expect.equals(document, html.parentNode);
}

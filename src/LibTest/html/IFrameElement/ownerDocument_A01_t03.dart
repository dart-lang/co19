/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Document ownerDocument
 * The document this node belongs to.
 * @description Checks ownerDocument of nodes created by innerHtml=
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var d = document.implementation.createHtmlDocument('doc');
  d.body.innerHtml = '<iframe class="y">Content Text</iframe>';

  Expect.equals(d, d.body.nodes[0].ownerDocument, 'first');
}

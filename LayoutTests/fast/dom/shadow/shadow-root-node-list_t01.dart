/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test should not crash
 */
import "dart:html";

main() {
  var host = document.createElement("blockquote");
  var shadow = host.createShadowRoot();
  var children = shadow.childNodes;
  document.body.append(host);

  document.body.offsetLeft;
  document.body.innerHtml = "PASS unless crash";
}

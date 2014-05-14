/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test should not crash
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var root = document.createElement("div");
  var shadow = root.createShadowRoot();
  var shadowBuilder = document.createElement("div");
  shadowBuilder.innerHtml = "<div></div>x";
  while (shadowBuilder.firstChild != null)
    shadow.append(shadowBuilder.firstChild);
  document.body.append(root);
  document.body.offsetLeft;
  document.body.innerHtml = "PASS unless crash";
}

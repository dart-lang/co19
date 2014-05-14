/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var div = document.createElement("div");
  document.body.append(div);

  var shadow1 = div.createShadowRoot();
  shadow1.innerHtml = "<style>div { color: red; }</style><div>HELLO</div>";

  var shadow2 = div.createShadowRoot();
  shadow2.innerHtml = "<div><shadow></shadow></div>";
  document.body.offsetLeft;
  document.body.innerHtml = "PASS";
}

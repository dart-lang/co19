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
  makeOrphanShadow() {
    var host = document.createElement("div");
    var shadow = host.createShadowRoot();
    return shadow;
  };

  var shadow = makeOrphanShadow();
  //gc(true);
  gc();

  try { shadow.innerHtml = "Hello"; } catch(e) { }
  shadow.append(document.createElement("span"));

  document.body.innerHtml = "PASS unless crash.";
}

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
  var depth = window.screen.pixelDepth;
  if (!(depth == 16 || depth == 24 || depth == 32)) {
    testFailed("window.screen.pixelDepth is $depth, expected 16, 24, or 32");
  }
  
  depth = window.screen.colorDepth;
  if (!(depth == 16 || depth == 24 || depth == 32)) {
    testFailed("window.screen.colorDepth is $depth, expected 16, 24, or 32");
  }
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks behavior of drawImage on a canvas that failed
 * to allocate its backing store. This test passes by not crashing.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas1 = document.createElement("canvas");
  var ctx1 = canvas1.getContext('2d');
  var canvas2 = document.createElement("canvas");
  // Terapixel canvas should fail to allocate
  canvas2.width = 1000000;
  canvas2.height = 1000000;
  var ctx2 = canvas2.getContext('2d');
  ctx2.drawImage(canvas1, 0, 0);
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks that there is no crash
 */
import "dart:html";

main() {
  dynamic canvas = document.createElement("canvas");
  canvas.getContext("2d").getImageData(10, 0xffffffff, 2147483647, 10);
}

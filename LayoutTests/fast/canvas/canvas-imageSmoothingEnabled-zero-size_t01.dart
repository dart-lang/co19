/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes by not crashing
 */
import "dart:html";

main() {
  dynamic canvas = document.createElement('canvas');
  canvas.width = 0;
  canvas.height = 0;
  var context = canvas.getContext('2d');
  if (context.imageSmoothingEnabled) {
    context.imageSmoothingEnabled = false;
  }
}

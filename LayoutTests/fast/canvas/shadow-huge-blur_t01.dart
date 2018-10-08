/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it does not cause a crash
 */
import "dart:html";

main() {
  document.body.append(document.createElement("p"))
    .append(new Text("This test passes if it does not cause a crash"));
  dynamic canvas = document.body.append(document.createElement("canvas"));
  canvas.width = 400;
  canvas.height = 400;
  var ctx = canvas.getContext('2d');
  ctx.shadowBlur = 10500000000;
  ctx.shadowColor = "green";
  ctx.fillRect(0, 0, 10, 10);
}

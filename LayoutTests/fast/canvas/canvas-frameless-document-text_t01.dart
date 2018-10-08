/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This verifies that the browser does not crash when drawing text
 * to a canvas in a frame-less document.
 */
import "dart:html";

main() {
  // It is not clear frome the spec whether this is supposed to work and how.
  // Therefore, we do not validate the rendering results. We just make sure
  // this does not crash the browser.
  dynamic canvas1 = document.createElement('canvas');
  var ctx1 = canvas1.getContext('2d');
  var htmlDoc = document.implementation.createHtmlDocument('');
  htmlDoc.adoptNode(canvas1);
  dynamic canvas2 = htmlDoc.createElement('canvas');
  var ctx2 = canvas2.getContext('2d');

  ctx1.font = 'italic 30px Arial';
  ctx2.font = 'italic 30px Arial';
  ctx1.fillText('Text1', 0, 30);
  ctx2.fillText('Text1', 0, 30);
  ctx1.strokeText('Text2', 0, 60);
  ctx2.strokeText('Text2', 0, 60);
  ctx1.measureText('Text3');
  ctx2.measureText('Text3');
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addEventListener(String type, EventListener listener,
 * [bool useCapture])
 * Register an event handler of a specific event type on the EventTarget.
 * @description Checks that listener for standard event can be added
 */
import "dart:html";

main() {
  CanvasElement canvas = new CanvasElement();
  CanvasRenderingContext2D ctx = canvas.context2D
    ..fillStyle = "rgb(200,0,0)"
    ..fillRect(10, 10, 55, 50);
  document.body.append(canvas);

//Create a new image element from the data URI.
  ImageElement img = new ImageElement();
  img.src = canvas.toDataUrl("image/jpeg", 0.95);
// The Data Uri would look similar to
// 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA
// AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
// 9TXL0Y4OHwAAAABJRU5ErkJggg=='

  document.body.children.add(img);
}

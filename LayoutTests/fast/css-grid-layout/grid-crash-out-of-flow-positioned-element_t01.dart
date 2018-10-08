/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <style>
      .absolutelyPositioned { position: absolute; }
      </style>
      crbug.com/280451 - Heap-use-after-free in WebCore::RenderGrid::computePreferredTrackWidth</br>
      This test has passed if it didn't crash.
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.setAttribute("style", "display: inline-grid;");

  var cell = document.createElement("cell");
  cell.setAttribute("class", "absolutelyPositioned");
  document.body.append(cell);
  window.scrollBy(98, 28);
  cell.setAttribute("class", "nonExistent");
}

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
import "../../resources/check-layout.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          grid-template-columns: 50px 100px;
          grid-template-rows: 50px 100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div>This test checks that updating the grid's element's grid-auto-flow property recomputes the grid.</div>
      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea autoRowAutoColumn" id="autoItem" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
              <div class="sizedToGridArea firstRowFirstColumn" data-offset-x="0" data-offset-y="0" data-expected-width="50" data-expected-height="50"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testGrid(flow, positionAndSize)
  {
    dynamic gridElement = document.getElementsByClassName("grid")[0];
    gridElement.style.gridAutoFlow = flow;
    var gridItem = document.getElementById("autoItem");
    gridItem.setAttribute("data-offset-x", positionAndSize['offsetX']);
    gridItem.setAttribute("data-offset-y", positionAndSize['offsetY']);
    gridItem.setAttribute("data-expected-width", positionAndSize['width']);
    gridItem.setAttribute("data-expected-height", positionAndSize['height']);
    checkLayout(".grid");
  }

  updateAutoFlow(_)
  {
    checkLayout(".grid");

    testGrid("row", { 'offsetX': '50', 'offsetY': '0', 'width': '100', 'height': '50' });
    testGrid("column", { 'offsetX': '0', 'offsetY': '50', 'width': '50', 'height': '100' });
    testGrid("invalid", { 'offsetX': '0', 'offsetY': '50', 'width': '50', 'height': '100' });
    testGrid("none", { 'offsetX': '0', 'offsetY': '0', 'width': '50', 'height': '50' });
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", updateAutoFlow, false);
}

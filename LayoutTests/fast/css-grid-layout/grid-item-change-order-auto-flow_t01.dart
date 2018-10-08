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
          grid-auto-flow: row;
          grid-template-rows: 50px 100px;
          grid-template-columns: 40px;
      }

      #firstGridItem {
          grid-row: auto;
          grid-column: 1;
      }

      #secondGridItem {
          grid-row: 1;
          grid-column: auto;
      }

      #thirdGridItem {
          grid-row: auto;
          grid-column: auto;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div>This test checks that grid items' 'order' dynamic updates recomputes the positions of automatically placed grid items.</div>

      <div style="position: relative">
          <div class="grid">
              <div class="sizedToGridArea" id="firstGridItem"></div>
              <div class="sizedToGridArea" id="secondGridItem"></div>
              <div class="sizedToGridArea" id="thirdGridItem"></div>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  testGridItemsOrder(firstGridItemData, secondGridItemData, thirdGridItemData)
  {
    var firstGridItem = document.getElementById("firstGridItem");
    firstGridItem.style.order = firstGridItemData['order'];
    firstGridItem.setAttribute("data-expected-width", firstGridItemData['width']);
    firstGridItem.setAttribute("data-expected-height", firstGridItemData['height']);
    firstGridItem.setAttribute("data-offset-x", firstGridItemData['x']);
    firstGridItem.setAttribute("data-offset-y", firstGridItemData['y']);

    var secondGridItem = document.getElementById("secondGridItem");
    secondGridItem.style.order = secondGridItemData['order'];
    secondGridItem.setAttribute("data-expected-width", secondGridItemData['width']);
    secondGridItem.setAttribute("data-expected-height", secondGridItemData['height']);
    secondGridItem.setAttribute("data-offset-x", secondGridItemData['x']);
    secondGridItem.setAttribute("data-offset-y", secondGridItemData['y']);

    var thirdGridItem = document.getElementById("thirdGridItem");
    thirdGridItem.style.order = thirdGridItemData['order'];
    thirdGridItem.setAttribute("data-expected-width", thirdGridItemData['width']);
    thirdGridItem.setAttribute("data-expected-height", thirdGridItemData['height']);
    thirdGridItem.setAttribute("data-offset-x", thirdGridItemData['x']);
    thirdGridItem.setAttribute("data-offset-y", thirdGridItemData['y']);

    checkLayout(".grid");
  }

  testChangingGridItemsOrder(_)
  {
    testGridItemsOrder({ 'order': '0', 'width': '40', 'height': '100', 'x': '0', 'y': '50' }, { 'order': '0', 'width': '40', 'height': '50', 'x': '0', 'y': '0' }, { 'order': '0', 'width': '40', 'height': '0', 'x': '0', 'y': '150' });
    testGridItemsOrder({ 'order': '0', 'width': '40', 'height': '100', 'x': '0', 'y': '50' }, { 'order': '-1', 'width': '40', 'height': '50', 'x': '0', 'y': '0' }, { 'order': '0', 'width': '40', 'height': '0', 'x': '0', 'y': '150' });
    testGridItemsOrder({ 'order': '1', 'width': '40', 'height': '0', 'x': '0', 'y': '150' }, { 'order': '-1', 'width': '40', 'height': '50', 'x': '0', 'y': '0' }, { 'order': '0', 'width': '40', 'height': '100', 'x': '0', 'y': '50' });
    testGridItemsOrder({ 'order': '1', 'width': '40', 'height': '100', 'x': '0', 'y': '50' }, { 'order': '-1', 'width': '40', 'height': '50', 'x': '0', 'y': '0' }, { 'order': '10', 'width': '40', 'height': '0', 'x': '0', 'y': '150' });
    asyncEnd();
  }

  asyncStart();
  window.addEventListener("load", testChangingGridItemsOrder, false);
}

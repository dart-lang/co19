/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that setting and getting grid-auto-flow works as expected
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .gridAutoFlowInherit {
          grid-auto-flow: inherit;
      }
      /* Bad values. */
      .gridAutoFlowRows {
          grid-auto-flow: rows;
      }
      .gridAutoFlowColumns {
          grid-auto-flow: columns;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="grid" id="gridInitial"></div>
      <div class="grid gridAutoFlowNone" id="gridAutoFlowNone"></div>
      <div class="grid gridAutoFlowColumn" id="gridAutoFlowColumn"></div>
      <div class="grid gridAutoFlowRow" id="gridAutoFlowRow"></div>
      <div class="grid gridAutoFlowColumn">
          <div class="grid gridAutoFlowInherit" id="gridAutoFlowInherit"></div>
      </div>
      <div class="grid gridAutoFlowColumn">
          <div><div class="grid gridAutoFlowInherit" id="gridAutoFlowNoInherit"></div><div>
      </div>
      <div class="grid gridAutoFlowColumns" id="gridAutoFlowColumns"></div>
      <div class="grid gridAutoFlowRows" id="gridAutoFlowRows"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    debug("Test getting auto-flow set through CSS");
    var gridAutoFlowNone = document.getElementById("gridAutoFlowNone");
    shouldBe(getComputedStyle(gridAutoFlowNone, '').getPropertyValue('grid-auto-flow'), 'none');

    var gridAutoFlowColumn = document.getElementById("gridAutoFlowColumn");
    shouldBe(getComputedStyle(gridAutoFlowColumn, '').getPropertyValue('grid-auto-flow'), 'column');

    var gridAutoFlowRow = document.getElementById("gridAutoFlowRow");
    shouldBe(getComputedStyle(gridAutoFlowRow, '').getPropertyValue('grid-auto-flow'), 'row');

    var gridAutoFlowColumns = document.getElementById("gridAutoFlowColumns");
    shouldBe(getComputedStyle(gridAutoFlowColumns, '').getPropertyValue('grid-auto-flow'), 'none');

    var gridAutoFlowRows = document.getElementById("gridAutoFlowRows");
    shouldBe(getComputedStyle(gridAutoFlowRows, '').getPropertyValue('grid-auto-flow'), 'none');

    var gridAutoFlowInherit = document.getElementById("gridAutoFlowInherit");
    shouldBe(getComputedStyle(gridAutoFlowInherit, '').getPropertyValue('grid-auto-flow'), 'column');

    var gridAutoFlowNoInherit = document.getElementById("gridAutoFlowNoInherit");
    shouldBe(getComputedStyle(gridAutoFlowNoInherit, '').getPropertyValue('grid-auto-flow'), 'none');

    debug("");
    debug("Test the initial value");
    var element = document.createElement("div");
    document.body.append(element);
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-flow'), 'none');

    debug("");
    debug("Test getting and setting grid-auto-flow through JS");
    element.style.gridAutoFlow = "column";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-flow'), 'column');

    element = document.createElement("div");
    document.body.append(element);
    element.style.gridAutoFlow = "row";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-flow'), 'row');

    debug("");
    debug("Test getting and setting bad values for grid-auto-flow through JS");
    element.style.gridAutoFlow = "noone";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-flow'), 'row');

    debug("");
    debug("Test setting grid-auto-flow to 'initial' through JS");
    // Reusing the value so that we can check that it is set back to its initial value.
    element.style.gridAutoFlow = "initial";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-flow'), 'none');
    asyncEnd();
  });
}

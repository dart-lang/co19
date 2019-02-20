/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that setting and getting grid-auto-columns and
 * grid-auto-rows works as expected
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .gridAutoFixedFixed {
          grid-auto-rows: 30px;
          grid-auto-columns: 50px;
      }

      .gridAutoMinMax {
          grid-auto-rows: minmax(10%, 15px);
          grid-auto-columns: minmax(30%, 100px);
      }

      .gridAutoMinMaxContent {
          grid-auto-rows: min-content;
          grid-auto-columns: max-content;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="grid gridAutoFixedFixed" id="gridAutoFixedFixed"></div>
      <div class="grid gridAutoMinMax" id="gridAutoMinMax"></div>
      <div class="grid gridAutoMinMaxContent" id="gridAutoMinMaxContent"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  addOnLoadListener((_) {
    debug("Test getting grid-auto-columns and grid-auto-rows set through CSS");
    var gridAutoFixedFixed = document.getElementById("gridAutoFixedFixed");
    shouldBe(getComputedStyle(gridAutoFixedFixed, '').getPropertyValue('grid-auto-rows'), '30px');
    shouldBe(getComputedStyle(gridAutoFixedFixed, '').getPropertyValue('grid-auto-columns'), '50px');

    var gridAutoMinMax = document.getElementById("gridAutoMinMax");
    shouldBe(getComputedStyle(gridAutoMinMax, '').getPropertyValue('grid-auto-rows'), 'minmax(10%, 15px)');
    shouldBe(getComputedStyle(gridAutoMinMax, '').getPropertyValue('grid-auto-columns'), 'minmax(30%, 100px)');

    var gridAutoMinMaxContent = document.getElementById("gridAutoMinMaxContent");
    shouldBe(getComputedStyle(gridAutoMinMaxContent, '').getPropertyValue('grid-auto-rows'), 'min-content');
    shouldBe(getComputedStyle(gridAutoMinMaxContent, '').getPropertyValue('grid-auto-columns'), 'max-content');

    debug("");
    debug("Test the initial value");
    var element = document.createElement("div");
    document.body.append(element);
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    debug("");
    debug("Test getting and setting grid-auto-columns and grid-auto-rows through JS");
    element.style.font = "10px Ahem";
    element.style.gridAutoColumns = "18em";
    element.style.gridAutoRows = "66em";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), '180px');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), '660px');

    element = document.createElement("div");
    document.body.append(element);
    element.style.gridAutoColumns = "minmax(min-content, 8vh)";
    element.style.gridAutoRows = "minmax(10vw, min-content)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'minmax(min-content, 48px)');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'minmax(80px, min-content)');

    element = document.createElement("div");
    document.body.append(element);
    element.style.gridAutoColumns = "minmax(min-content, max-content)";
    element.style.gridAutoRows = "minmax(max-content, min-content)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'minmax(min-content, max-content)');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'minmax(max-content, min-content)');

    debug("");
    debug("Test setting grid-auto-columns and grid-auto-rows to bad minmax value through JS");
    element = document.createElement("div");
    document.body.append(element);
    // No comma.
    element.style.gridAutoColumns = "minmax(10px 20px)";
    // Only 1 argument provided.
    element.style.gridAutoRows = "minmax(10px)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    element = document.createElement("div");
    document.body.append(element);
    // Nested minmax.
    element.style.gridAutoColumns = "minmax(minmax(10px, 20px), 20px)";
    // Only 2 arguments are allowed.
    element.style.gridAutoRows = "minmax(10px, 20px, 30px)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    element = document.createElement("div");
    document.body.append(element);
    // No breadth value.
    element.style.gridAutoColumns = "minmax()";
    // No comma.
    element.style.gridAutoRows = "minmax(30px 30% 30em)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    element = document.createElement("div");
    document.body.append(element);
    // Auto is not allowed inside minmax.
    element.style.gridAutoColumns = "minmax(auto, 8vh)";
    element.style.gridAutoRows = "minmax(10vw, auto)";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    element = document.createElement("div");
    document.body.append(element);
    // None is not allowed for grid-auto-{rows|columns}.
    element.style.gridAutoColumns = "none";
    element.style.gridAutoRows = "none";
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
    shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

    testInherit()
    {
      var parentElement = document.createElement("div");
      document.body.append(parentElement);
      parentElement.style.gridAutoColumns = "50px";
      parentElement.style.gridAutoRows = "101%";

      element = document.createElement("div");
      parentElement.append(element);
      element.style.gridAutoColumns = "inherit";
      element.style.gridAutoRows = "inherit";
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), '50px');
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), '101%');

      parentElement.remove();
    }

    debug("");
    debug("Test setting grid-auto-columns and grid-auto-rows to 'inherit' through JS");
    testInherit();

    testInitial()
    {
      element = document.createElement("div");
      document.body.append(element);
      element.style.gridAutoColumns = "150%";
      element.style.gridAutoRows = "1fr";
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), '150%');
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), '1fr');

      element.style.gridAutoColumns = "initial";
      element.style.gridAutoRows = "initial";
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-columns'), 'auto');
      shouldBe(getComputedStyle(element, '').getPropertyValue('grid-auto-rows'), 'auto');

      element.remove();
    }

    debug("");
    debug("Test setting grid-auto-columns and grid-auto-rows to 'initial' through JS");
    testInitial();

    asyncEnd();
  });
}

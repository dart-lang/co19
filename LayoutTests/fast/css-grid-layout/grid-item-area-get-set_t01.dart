/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that grid-area is properly parsed and stored
 * internally.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      .grid {
          grid-template-areas: "firstArea secondArea"
                               "thirdArea thirdArea";
      }

      #oneValueGridArea {
          grid-area: 1;
      }

      #oneValueIdentGridArea {
          grid-area: thirdArea;
      }

      #twoValueGridArea {
          grid-area: -1 / span 1;
      }

      #twoValueIdentGridArea {
          grid-area: firstArea / secondArea;
      }

      #threeValueGridArea {
          grid-area: span / 10 / -1;
      }

      #fourValueGridArea {
          grid-area: -5 / 5 span / span 8 / 9;
      }

      #fourValueMixedGridArea {
          grid-area: firstArea / span / nonExistent / "foobar";
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="grid">
          <div id="oneValueGridArea"></div>
          <div id="oneValueIdentGridArea"></div>
          <div id="twoValueGridArea"></div>
          <div id="twoValueIdentGridArea"></div>
          <div id="threeValueGridArea"></div>
          <div id="fourValueGridArea"></div>
          <div id="fourValueMixedGridArea"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    valueOrDefaultGridPosition(gridPosition) {
      return gridPosition == null ? "auto" : gridPosition;
    }

    checkColumnRowValues(gridItem, gridRowStart, gridColumnStart, gridRowEnd, gridColumnEnd) {
      shouldBeEqualToString(getComputedStyle(gridItem, '').getPropertyValue('grid-row-start'), gridRowStart);
      shouldBeEqualToString(getComputedStyle(gridItem, '').getPropertyValue('grid-column-start'), valueOrDefaultGridPosition(gridColumnStart));
      shouldBeEqualToString(getComputedStyle(gridItem, '').getPropertyValue('grid-row-end'), valueOrDefaultGridPosition(gridRowEnd));
      shouldBeEqualToString(getComputedStyle(gridItem, '').getPropertyValue('grid-column-end'), valueOrDefaultGridPosition(gridColumnEnd));
    }

    testGridAreaCSSParsing(gridItemId, gridRowStart, [gridColumnStart, gridRowEnd, gridColumnEnd]) {
      checkColumnRowValues(document.getElementById(gridItemId), gridRowStart, gridColumnStart, gridRowEnd, gridColumnEnd);
    }

    testGridAreaJSParsing(gridAreaValue) {
      var element = document.createElement("div");
      document.body.append(element);
      // Pre-fill it with values to detect that we properly handle and reset unset values.
      element.style.gridArea = "1 / 2 / 3 / 4";
      element.style.gridArea = gridAreaValue;

      // Get the different values.
      var gridColumnRowValues = gridAreaValue.split("/");
      var gridRowStart = gridColumnRowValues.length > 1 ? gridColumnRowValues[1].trim() : null;
      var gridColumnEnd = gridColumnRowValues.length > 2 ? gridColumnRowValues[2].trim() : null;
      var gridRowEnd = gridColumnRowValues.length > 3 ? gridColumnRowValues[3].trim() : null;
      checkColumnRowValues(element, gridColumnRowValues[0].trim(), gridRowStart, gridColumnEnd, gridRowEnd);
      element.remove();
    }

    testGridAreaInvalidJSParsing(gridAreaValue) {
      var element = document.createElement("div");
      document.body.append(element);
      checkColumnRowValues(element, "auto", "auto", "auto", "auto");
      element.remove();
    }

    testInitialGridArea() {
      var element = document.createElement("div");
      document.body.append(element);
      element.style.gridArea = "1 / 2 / 3 / 4";
      checkColumnRowValues(element, "1", "2", "3", "4");

      element.style.gridArea = "initial";
      checkColumnRowValues(element, "auto", "auto", "auto", "auto");

      element.remove();
    }

    testInheritGridArea() {
      var parentElement = document.createElement("div");
      document.body.append(parentElement);
      parentElement.style.gridArea = "1 / 2 / 3 / 4";
      checkColumnRowValues(parentElement, "1", "2", "3", "4");

      var element = document.createElement("div");
      parentElement.append(element);
      element.style.gridArea = "inherit";
      checkColumnRowValues(element, "1", "2", "3", "4");

      parentElement.remove();
    }

    debug("Test getting grid-area set through CSS");
    testGridAreaCSSParsing("oneValueGridArea", "1");
    testGridAreaCSSParsing("oneValueIdentGridArea", "thirdArea", "thirdArea", "thirdArea", "thirdArea");
    testGridAreaCSSParsing("twoValueGridArea", "-1", "span 1");
    testGridAreaCSSParsing("twoValueIdentGridArea", "firstArea", "secondArea", "firstArea", "secondArea");
    testGridAreaCSSParsing("threeValueGridArea", "span 1", "10", "-1");
    testGridAreaCSSParsing("fourValueGridArea", "-5", "span 5", "span 8", "9");
    testGridAreaCSSParsing("fourValueMixedGridArea", "firstArea", "span 1", "nonExistent", "1 foobar");

    debug("");
    debug("Test getting and setting grid-area set through JS");
    testGridAreaJSParsing("-1");
    testGridAreaJSParsing("-1 / span 5");
    testGridAreaJSParsing("-1 / 10 / span 3");

    debug("");
    debug("Test setting grid-area to 'initial' through JS");
    testInitialGridArea();

    debug("");
    debug("Test setting grid-area to 'inherit' through JS");
    testInheritGridArea();

    debug("");
    debug("Test setting some positions to invalid values through JS");
    testGridAreaInvalidJSParsing("span / span / span /");
    testGridAreaInvalidJSParsing("1/ span span / 1 / span");
    testGridAreaInvalidJSParsing("span / 1 / -1 / 1 -1");
    testGridAreaInvalidJSParsing("span / 1 / -1 / 1 span -1");
    asyncEnd();
  });
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks that grid-template-areas is properly parsed.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var f = new DocumentFragment.html('''
      <link href="$root/resources/grid.css" rel="stylesheet">
      <style>
      #gridWithSingleStringTemplate {
          grid-template-areas: "area";
      }

      #gridWithTwoColumnsTemplate {
          grid-template-areas: "first second";
      }

      #gridWithTwoRowsTemplate {
          grid-template-areas: "first"
                               "second";
      }

      #gridWithSpanningColumnsTemplate {
          grid-template-areas: "span span";
      }

      #gridWithSpanningRowsDotTemplate {
          grid-template-areas: "span"
                               ".";
      }

      #gridWithDotColumn {
          grid-template-areas: "header ."
                               "footer .";
      }

      #gridWithHorizontalRectangle {
          grid-template-areas: "a a a"
                               "a a a";
      }

      #gridWithVerticalRectangle {
          grid-template-areas: "a a"
                               "a a"
                               "a a";
      }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <div class="grid" id="gridWithDefaultTemplate"></div>
      <div class="grid" id="gridWithSingleStringTemplate"></div>
      <div class="grid" id="gridWithTwoColumnsTemplate"></div>
      <div class="grid" id="gridWithTwoRowsTemplate"></div>
      <div class="grid" id="gridWithSpanningColumnsTemplate"></div>
      <div class="grid" id="gridWithSpanningRowsDotTemplate"></div>
      <div class="grid" id="gridWithDotColumn"></div>
      <div class="grid" id="gridWithHorizontalRectangle"></div>
      <div class="grid" id="gridWithVerticalRectangle"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    debug("Test getting grid-template-areas set through CSS.");
    var gridWithDefaultTemplate = document.getElementById("gridWithDefaultTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithDefaultTemplate).getPropertyValue('grid-template-areas'), "none");

    var gridWithSingleStringTemplate = document.getElementById("gridWithSingleStringTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithSingleStringTemplate).getPropertyValue('grid-template-areas'), '"area"');

    var gridWithTwoColumnsTemplate = document.getElementById("gridWithTwoColumnsTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithTwoColumnsTemplate).getPropertyValue('grid-template-areas'), '"first second"');

    var gridWithTwoRowsTemplate = document.getElementById("gridWithTwoRowsTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithTwoRowsTemplate).getPropertyValue('grid-template-areas'), '"first" "second"');

    var gridWithSpanningColumnsTemplate = document.getElementById("gridWithSpanningColumnsTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithSpanningColumnsTemplate).getPropertyValue('grid-template-areas'), '"span span"');

    var gridWithSpanningRowsDotTemplate = document.getElementById("gridWithSpanningRowsDotTemplate");
    shouldBeEqualToString(getComputedStyle(gridWithSpanningRowsDotTemplate).getPropertyValue('grid-template-areas'), '"span" "."');

    var gridWithDotColumn = document.getElementById("gridWithDotColumn");
    shouldBeEqualToString(getComputedStyle(gridWithDotColumn).getPropertyValue('grid-template-areas'), '"header ." "footer ."');

    var gridWithHorizontalRectangle = document.getElementById("gridWithHorizontalRectangle");
    shouldBeEqualToString(getComputedStyle(gridWithHorizontalRectangle).getPropertyValue('grid-template-areas'), '"a a a" "a a a"');

    var gridWithVerticalRectangle = document.getElementById("gridWithVerticalRectangle");
    shouldBeEqualToString(getComputedStyle(gridWithVerticalRectangle).getPropertyValue('grid-template-areas'), '"a a" "a a" "a a"');

    debug("Test grid-template-areas: initial");
    var element = document.createElement("div");
    document.body.append(element);
    element.style.gridTemplateAreas = "'foobar'";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), '"foobar"');
    element.style.gridTemplateAreas = "initial";
    element.remove();

    debug("Test grid-template-areas: inherit");
    var parentElement = document.createElement("div");
    document.body.append(parentElement);
    parentElement.style.gridTemplateAreas = "'foo bar'";
    shouldBeEqualToString(getComputedStyle(parentElement).getPropertyValue('grid-template-areas'), '"foo bar"');

    element = document.createElement("div");
    parentElement.append(element);
    element.style.gridTemplateAreas = "inherit";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), '"foo bar"');
    parentElement.remove();

    debug("Test invalid grid-template-areas values.");
    element = document.createElement("div");
    document.body.append(element);

    // 'nav' is not a rectangular definition.
    element.style.gridTemplateAreas = "'nav head' 'nav nav'";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");

    // 'nav' is not contiguous in the column direction.
    element.style.gridTemplateAreas = "'nav head nav'";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");

    // 'nav' is not contiguous in the row direction.
    element.style.gridTemplateAreas = "'nav head' 'middle middle' 'nav footer'";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");

    // The rows don't have the same number of columns.
    element.style.gridTemplateAreas = "'nav head' 'foot'";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");

    // Empty rows.
    element.style.gridTemplateAreas = "'' ''";
    shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");

    debug("");
    debug("FIXME: We currently don't validate that the named grid areas are &lt;indent&gt;.");
    // <ident> only allows a leading '-'.
    element.style.gridTemplateAreas = '"nav-up"';
    //shouldBeEqualToString(getComputedStyle(element).getPropertyValue('grid-template-areas'), "none");
    asyncEnd();
  });
}

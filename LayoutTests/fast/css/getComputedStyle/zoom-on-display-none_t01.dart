/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        .test_div {
          zoom: 2;
          width: 300px;
        }
        
        #zoomed_and_displayed {
          background: #ccc;
        }
        #zoomed_and_hidden {
          display: none;
          background: orange;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="result">FAIL.</div>
      <br/>

      <div id="zoomed_and_displayed" class="test_div">
        This div has a zoom value of "2." It has a width of 300px.
      </div>
      <div id="zoomed_and_hidden" class="test_div">
        This div is has a zoom value of "2" and is hidden. It has a width of 300px.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

    var zoomedAndDisplayed = document.getElementById("zoomed_and_displayed");
    var zoomedAndHidden = document.getElementById("zoomed_and_hidden");
    var renderedWidth = zoomedAndDisplayed.scrollWidth;
    parseWidth(str) => double.parse(str.substring(0, str.length-2)); // trim trailing 'px'
    var computedWidthDisplayed = parseWidth(getComputedStyle(zoomedAndDisplayed).width);
    var computedWidthHidden = parseWidth(getComputedStyle(zoomedAndHidden).width);

    var result = document.getElementById("result");    
    if (computedWidthHidden == computedWidthDisplayed && computedWidthDisplayed == renderedWidth)
        result.innerHtml = "PASS! Neither the computed width of the displayed div nor the computed width of the display:none div has been affected by the zoom factor.";
}

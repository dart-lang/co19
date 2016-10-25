/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description getComputedStyle() Zoom and Background Size
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        #test_area {
          position: relative;
        }
        .test_div {
          zoom: 2;
          width: 300px;
        }
        
        #zoomed_and_displayed {
          display: block;
        }
        #zoomed_and_hidden {
          display: none;
        }
        
        #results {
          overflow: hidden;
        }
          .results {
            float: left;
            margin-right: 2em;
          }
            .results table {
              border-collapse: collapse;
              line-height: 1.4em;
            }
            .results th {
              text-align: left;
            }
            .results th,
            .results td {
              padding: 0 1em 0 0;
              border-bottom: 1px solid #ddd;
            }
            .results .test-pass {
              color: green;
            }
            .results .test-fail {
              color: red;
            }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      Checks that getComputedStyle() on a zoomed element returns the right thing. 
      <section id="results">
        <section class="results">
          <h2>Results while display:block</h2>
          <table>
            <thead>
              <tr>
                <th>Property</th>
                <th>Pass?</th>
                <th>Set Value</th>
                <th>Computed Value</th>
            <tbody id="results_body">
            </tbody>
          </table>
        </section>
        
        <section class="results">
          <h2>Results while display:none</h2>
          <table>
            <thead>
              <tr>
                <th>Hidden Property</th>
                <th>Pass?</th>
                <th>Set Value</th>
                <th>Computed Value</th>
            <tbody id="results_hidden_body">
            </tbody>
          </table>
        </section>
      </section>

      <div id="test_area">
        <div id="zoomed_and_displayed" class="test_div">
          This div has a zoom value of "2." It has a width of 300px.
          Its background size is: 400px by 300px.
        </div>
        <div id="zoomed_and_hidden" class="test_div">
          This div is has a zoom value of "2" and is hidden. It has a width of 300px.
          Its background size is: 400px by 300px.
        </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var propertiesToCheck = {
    "background-position": "10px 10px",
    "background-size": "400px 300px",
    "-webkit-border-horizontal-spacing": "10px",
    "-webkit-border-vertical-spacing": "10px",

    // Need style or width won't be applied
    "border-top-style": "solid",
    "border-top-width": "2px",
    "border-right-style": "solid",
    "border-right-width": "2px",
    "border-bottom-style": "solid",
    "border-bottom-width": "2px",
    "border-left-style": "solid",
    "border-left-width": "2px",

    "border-top-left-radius": "5px",
    "border-top-right-radius": "5px",
    "border-bottom-left-radius": "5px",
    "border-bottom-right-radius": "5px",

    // Need style or width won't be applied
    "outline-style": "solid",
    "outline-width": "2px",

    // Need style or width won't be applied
    "-webkit-column-rule-width": "10px",
    "-webkit-column-rule-style": "solid",

    "-webkit-column-width": "80px",
    "-webkit-column-gap": "20px",

    "-webkit-mask-position": "10px 10px",
    "-webkit-mask-size": "10px 10px",
    "-webkit-perspective": "400px",
    "-webkit-perspective-origin": "20px 20px",
    "-webkit-text-stroke-width": "2px",
    "-webkit-transform-origin": "10px 10px",

    "position":"absolute",

    "left": "20px",
    "top": "20px",
    "right": "50px",
    "bottom": "50px",

    "font-size": "20px",
    "width": "400px",
    "max-width": "900px",
    "min-width": "200px",
    "height": "250px",
    "max-height": "600px",
    "min-height": "200px",
    "letter-spacing": "2px",
    "word-spacing": "10px",

    "margin-top": "10px",
    "margin-right": "10px",
    "margin-bottom": "10px",
    "margin-left": "10px",

    "padding-top": "10px",
    "padding-right": "10px",
    "padding-bottom": "10px",
    "padding-left": "10px",

    "text-indent": "10px"
  };

  var zoomedAndDisplayed = document.getElementById("zoomed_and_displayed"),
      zoomedAndHidden    = document.getElementById("zoomed_and_hidden"),
      tbody              = document.getElementById("results_body"),
      tbodyHidden        = document.getElementById("results_hidden_body"),
      overallPass        = true;

  var testProperties = (testElement, resultBody) {
    // Apply properties
    for (var property in propertiesToCheck.keys) {
      testElement.style.setProperty(property, propertiesToCheck[property]);
    }

    // Check properties
    var computed = getComputedStyle(testElement);
    for (var property in propertiesToCheck.keys) {
      var originalValue = propertiesToCheck[property],
          computedValue = computed.getPropertyValue(property),
          pass = computedValue == originalValue;

      var row = document.createElement("tr"),
          propertyCell = document.createElement("td"),
          passCell = document.createElement("td"),
          originalCell = document.createElement("td"),
          computedCell = document.createElement("td");

      propertyCell.append(new Text(property));    
      passCell.append(new Text(pass ? "PASS" : "FAIL"));
      originalCell.append(new Text(originalValue));    
      computedCell.append(new Text(computedValue));
      row.append(propertyCell);
      row.append(passCell);
      row.append(originalCell);
      row.append(computedCell);
      row.className = "test-" + (pass ? "pass" : "fail");
      resultBody.append(row);

      overallPass = overallPass && pass;
    }
  };

  testProperties(zoomedAndDisplayed, tbody);
  testProperties(zoomedAndHidden, tbodyHidden);
}

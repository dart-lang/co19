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
          grid-template-columns: 50px 100px 200px;
          grid-template-rows: 50px 100px 200px;
          background-color: #aaa;
      }
      .grid > * {
          margin: 0; /* Disable any margins as they change the top / left offsets. */
          grid-column: 2;
          grid-row: 3;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>This test checks that the grid items' 'display' computed value matches the specification. It also checks that the grid items are placed in the right grid area.</p>

      <div style="position: relative;">
          <div class="grid">
              <!-- These values are taken from the table in CSS 2.1 Chapter 9.7. -->
              <div data-expected-display="table" data-offset-x="50" data-offset-y="150" style="display: inline-table"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: inline"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-row-group"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-column"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-column-group"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-header-group"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-footer-group"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-row"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-cell"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: table-caption"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: inline-block"></div>

              <!-- Some extra values we support. -->
              <div data-expected-display="flex" data-offset-x="50" data-offset-y="150" style="display: flex"></div>
              <div data-expected-display="flex" data-offset-x="50" data-offset-y="150" style="display: flex"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: -webkit-inline-block"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: compact"></div>
              <div data-expected-display="block" data-offset-x="50" data-offset-y="150" style="display: run-in"></div>

              <!-- Elements with custom renderers. -->
              <button data-expected-display="block" data-offset-x="50" data-offset-y="150"></button>
              <canvas data-expected-display="block" data-offset-x="50" data-offset-y="150">canvas</canvas>
              <iframe data-expected-display="block" data-offset-x="50" data-offset-y="150" src="data:text/html,<body bgcolor=#fff>iframe</body>"></iframe>
              <iframe seamless data-expected-display="block" data-offset-x="50" data-offset-y="150" src="data:text/html,<body bgcolor=#fff>iframe</body>"></iframe>
              <object data-expected-display="block" data-offset-x="50" data-offset-y="150">object</object>
              <select data-expected-display="block" data-offset-x="50" data-offset-y="150">
                  <option>select</option>
              </select>
              <textarea data-expected-display="block" data-offset-x="50" data-offset-y="150">textarea</textarea>
              <input data-expected-display="block" data-offset-x="50" data-offset-y="150" type="checkbox" value="radio"></input>
              <input data-expected-display="block" data-offset-x="50" data-offset-y="150" type="file" value="file"></input>
              <input data-expected-display="block" data-offset-x="50" data-offset-y="150" type="image" value="image"></input>
              <input data-expected-display="block" data-offset-x="50" data-offset-y="150" type="password" value="image"></input>
              <input data-expected-display="block" data-offset-x="50" data-offset-y="150" type="text" value="text"></input>

              <img data-expected-display="block" data-offset-x="50" data-offset-y="150" src="$root/../images/resources/green-256x256.jpg"></img>
              <img data-expected-display="block" data-offset-x="50" data-offset-y="150" src="IntentionallyMissingFile.png"></img>

              <svg data-expected-display="block" data-offset-x="50" data-offset-y="150">
                  <circle cx="50" cy="50" r="50" fill="blue">
                  </circle>
              </svg>

              <!-- Spans are common so they should be tested. -->
              <span data-expected-display="block" data-offset-x="50" data-offset-y="150"></span>
          </div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    checkLayout('.grid > *');
    asyncEnd();
  });
}

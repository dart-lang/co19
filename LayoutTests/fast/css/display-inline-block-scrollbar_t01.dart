/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for crbug.com/316549: This test passes if the scrollable
 * div has width=250.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "../../resources/check-layout.dart";

main() {
  var style = new Element.html('''
      <style>
          #spacer {
              width: 100px;
              height: 100px;
              background: blue;
          }
          #scrollable {
              background: white;
              border: 1px solid black;
              overflow: auto;
              position: relative;
              width: 250px;
          }
          #container {
              position: relative;
              display: inline-block;
              width: 100%;
              height: 130px;
          }
          #margin {
              position: absolute;
              width: 200px;
              top: 12px;
              margin-right: 12px;
              left: 12px;
              height: 110px;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      Test for crbug.com/316549: This test passes if the scrollable div has width=250.<br/>
      <div id="scrollable" data-expected-scroll-width="250">
          <div id="container" style="width: 100%;">
              <div id="margin" style="left: 12px;">
                  <div id="spacer" style="height: 100px; width: 100%;"></div>
              </div>
          </div>
      </div>
      <div id="output"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('container').style.width = '110%';
  document.getElementById('margin').style.left = '200px';
  document.getElementById('container').style.width = '100%';
  var forceLayout = document.body.offsetTop;
  document.getElementById('margin').style.left = '12px';
  checkLayout('#scrollable', document.getElementById('output'));
}

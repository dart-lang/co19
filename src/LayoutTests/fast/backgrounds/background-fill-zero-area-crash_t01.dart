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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          #a {
              background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(black));
              -webkit-background-size: auto 50px;
              -webkit-box-sizing: border-box;
              border: 1px solid black;
              width: 100px;
              height: 2px;
          }
          #b {
              background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(black));
              -webkit-background-size: 50px auto;
              -webkit-box-sizing: border-box;
              border: 1px solid black;
              width: 2px;
              height: 100px;
          }
          #c {
              background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(black));
              -webkit-background-size: contain;
              -webkit-box-sizing: border-box;
              border: 1px solid black;
              width: 2px;
              height: 100px;
          }
          #d {
              background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(black));
              -webkit-background-size: contain;
              -webkit-box-sizing: border-box;
              border: 1px solid black;
              width: 100px;
              height: 2px;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test of some edge cases for background fills with generated images. Test passed if it rendered and there was no division by zero.</p>
      <div id="a"></div>
      <div id="b"></div>
      <div id="c"></div>
      <div id="d"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
}


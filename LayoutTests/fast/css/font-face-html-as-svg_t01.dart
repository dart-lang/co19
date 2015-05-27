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

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: 'family'; src: url('data:text/html,<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head><title>this is not SVG</title></head></html>') format('svg');
      }
      span {
          font-family: 'family';
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <p>
      This test verifies that loading a HTML document as SVG webfont does not crash the renderer.
      </p>
      <span id="s">PASS - This test did not crash</span>
      ''', treeSanitizer: new NullTreeSanitizer());

  addCss() {
    var cssNode = document.createElement('style');
    cssNode.type = 'text/css';
    var head = document.getElementsByTagName('head')[0];
    head.append(cssNode);
    var cssTextNode = new Text('p { font-weight: bold; }');
    cssNode.append(cssTextNode);
  }

  document.getElementById('s').offsetWidth;
  addCss();
}

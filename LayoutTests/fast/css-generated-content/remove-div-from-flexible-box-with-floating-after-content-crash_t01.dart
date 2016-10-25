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

main() {
  var style = new Element.html('''
      <style>
      .c1::after { float: left; content: open-quote; }
      .c1:first-letter { display: table-column; }
      .c1[class~="c1"] { display: -webkit-inline-box; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var parentDiv = document.createElement('div');
  var childDiv = document.createElement('div');

  parentDiv.setAttribute('class', 'c1');
  document.documentElement.append(parentDiv);
  parentDiv.append(childDiv);
  parentDiv.append(new Text('PASS if no exception or crash'));
  document.documentElement.offsetHeight; // forces a layout
  childDiv.remove();
}


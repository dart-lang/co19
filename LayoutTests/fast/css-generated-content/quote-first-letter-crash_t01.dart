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
      .class1::first-letter { position: inherit; }
      .class1:after { visibility: inherit; content: open-quote; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var element1 = document.createElement('hr');
  element1.setAttribute('class', 'class1');
  document.documentElement.append(element1);
  var element2 = document.createElement('td');
  element2.setAttribute('class', 'class1');
  document.documentElement.append(element2);
  document.documentElement.offsetTop;
}

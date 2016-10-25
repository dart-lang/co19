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
      .floatingBefore::before { overflow: visible; float: left; content: open-quote; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var tbodyElement = document.createElement('tbody');
  var listItemElement = document.createElement('li');
  listItemElement.setAttribute('class', 'floatingBefore');
  document.documentElement.append(listItemElement);
  var headerElement = document.createElement('header');
  listItemElement.append(headerElement);
  listItemElement.append(document.createElement('sub'));
  document.documentElement.offsetHeight;
  tbodyElement.append(headerElement);

  document.documentElement.append(new Text('PASS if no crash or assert in debug'));
}

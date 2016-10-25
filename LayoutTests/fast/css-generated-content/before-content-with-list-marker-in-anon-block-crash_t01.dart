/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS if no assert or crash on debug
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style>
      .c9::before { float: right; content: counter(section); }
      .c9 { display: list-item; }
      .c19 { display: table-row; }
      .c19:nth-child(even) { position: fixed; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var firstDiv = document.createElement('div');
  document.documentElement.append(firstDiv);

  var secondDiv = document.createElement('div');
  document.documentElement.append(secondDiv);

  var childDivListItem = document.createElement('div');
  childDivListItem.setAttribute('class', 'c9');
  document.documentElement.append(childDivListItem);

  var citeNode = document.createElement('cite');
  citeNode.setAttribute('class', 'c19');
  document.documentElement.append(citeNode);

  var parentDivListItem = document.createElement('div');
  parentDivListItem.setAttribute('class', 'c9');

  citeNode.append(parentDivListItem);

  document.body.offsetTop;
  parentDivListItem.append(childDivListItem);
  document.body.offsetTop;
  secondDiv.setAttribute('class', 'c1');
  document.body.offsetTop;
  firstDiv.setAttribute('class', 'c1');
}

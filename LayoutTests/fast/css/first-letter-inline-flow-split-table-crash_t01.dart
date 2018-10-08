/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS, if no exception or crash observed
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .noFloat:empty { float: none; }
      .theadStyle:nth-last-child(odd) { display: table-header-group; float: right; }
      .pSpanStyle { overflow: hidden; -webkit-appearance: button; }
      .pSpanStyle:first-letter { text-align: -webkit-left; content: counter(section); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var parentSpan =  document.createElement('span');
  var childSpan =  document.createElement('span');
  var thead = document.createElement('thead');
  var textNode = new Text('abc');

  removeTextNode() {
    textNode.remove();
    asyncEnd();
  }

  removeTable() {
    thead.remove();
    setTimeout(removeTextNode, 10);
  }

  changeClass() {
    thead.setAttribute('class', 'noFloat');
    setTimeout(removeTable, 10);
  }

  runTest() {
    parentSpan.setAttribute('class', 'pSpanStyle');
    document.documentElement.append(parentSpan);
    childSpan.setAttribute('class', 'noFloat');
    parentSpan.append(childSpan);
    thead.setAttribute('class', 'theadStyle');
    childSpan.append(thead);
    childSpan.append(textNode);
    setTimeout(changeClass(), 10);
  }

  asyncStart();
  runTest();
}

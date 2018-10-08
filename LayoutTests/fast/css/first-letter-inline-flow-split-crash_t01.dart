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
      .spanStyle { float: inherit; }
      .inlineFL::first-letter { visibility: visible; }
      .floatFL { float: right; }
      .floatFL::first-letter { position: absolute; content: 'A'; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var parentDiv = document.createElement('div');
  var childSpan = document.createElement('span');
  var childDiv = document.createElement('div');
  var textNode =  new Text('bcd');

  removeTextNode() {
    textNode.remove();
    asyncEnd();
  }

  changeClass() {
    parentDiv.setAttribute('class', 'inlineFL');
    setTimeout(removeTextNode, 10);
  }

  runTest() {
    parentDiv.setAttribute('class', 'floatFL');
    document.documentElement.append(parentDiv);
    childSpan = document.createElement('span');
    childSpan.setAttribute('class', 'spanStyle');
    parentDiv.append(childSpan);
    parentDiv.append(textNode);
    childSpan.append(childDiv);
    setTimeout(changeClass(), 10);
  }

  asyncStart();
  runTest();
}

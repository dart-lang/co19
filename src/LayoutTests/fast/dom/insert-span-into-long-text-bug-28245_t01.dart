/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that inserting a span into a selection of a div with
 * lots of non-word-broken characters doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #highlighted
      {
        white-space: pre-wrap;
      }
      </style>
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="highlighted"></div>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug(str) {
    var pre = document.getElementById('console');
    pre.append(new Text(str + '\n'));
  }

  var str = '____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________';
  var div = document.getElementById('highlighted');
  div.innerHtml = '<div>' + str + '\n</div>';
  debug(div.innerHtml);

  // Test crash
  var sel = window.getSelection();
  sel.setPosition(div.firstChild, 0);

  var range = sel.getRangeAt(0);
  var span = document.createElement('SPAN');
  range.insertNode(span);
  debug(div.innerHtml);
}

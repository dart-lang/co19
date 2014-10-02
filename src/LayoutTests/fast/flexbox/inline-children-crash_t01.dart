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
  var f = new DocumentFragment.html('''
      <style>
      #flexbox {
        display: -moz-box;
        display: -khtml-box;
        display: box;
        width: 100px;
        height: 100px;
        -moz-box-orient: vertical;
        -webkit-box-orient: vertical;
        box-orient: vertical;
        -webkit-line-clamp: 50%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Remove last block content from a flexbox, leaving only inline content. This should not crash</p>

      <div id="flexbox"><div id=remove></div>text</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var flexbox = document.getElementById('flexbox');
  flexbox.firstChild.remove();
}

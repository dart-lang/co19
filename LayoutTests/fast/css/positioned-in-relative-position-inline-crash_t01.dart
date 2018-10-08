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
      <style type="text/css">
      .inlineContainer {
        position: relative;
        display: inline;
      }
      #positioned {
        position: absolute;
        top: 100px;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      PASS, if no exception or crash in debug
      <div class='inlineContainer'>
        <div>div1</div>
        <div id='positioned'>div2</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('positioned').innerHtml = '2';
  document.getElementById('positioned').style.color = 'red';

  asyncStart();
  setTimeout(asyncEnd, 10);
}

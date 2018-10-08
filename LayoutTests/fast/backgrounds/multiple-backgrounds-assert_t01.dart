/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Should not assert
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css" media="screen">
        .box {
          height: 100px;
          width: 100px;
          margin: 10px;
          border: 1px solid black;
          background-repeat: no-repeat;
        }
        
        /* Mismatched layers */
        #box {
          background-image: url('$root/repeat/resources/white.gif');
        }
        
        #box.final {
          background-image: url('$root/repeat/resources/white.gif'), url('$root/repeat/resources/white.gif');
        }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=28295">https://bugs.webkit.org/show_bug.cgi?id=28295</a>; should not assert.</p>
      <div id="box" class="box"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_)
  {
    document.getElementById('box').className = 'box final';
    setTimeout(() {
      document.getElementById('box').style.display = 'none';
      asyncEnd();
    }, 0);
  }

  asyncStart();
  window.addEventListener('load', runTest, false);
}

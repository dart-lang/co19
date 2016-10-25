/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style type="text/css" media="screen">
        ul {
          list-style-image: url('foopy.png');
          background-image: url('foopy1.png');
          -webkit-border-image: url('foopy2.png');
          -webkit-mask-box-image: url('foopy3.png');
          -webkit-mask: below url('foopy4.png');
        }
        
        ul {
          list-style-image: none;
          background-image: none;
          -webkit-border-image: none;
          -webkit-mask-box-image: none;
          -webkit-mask: below none;
        }
        
        .box {
          content: url('foopy5.png') url('foopy6.png');
        }
        
        .box {
          content: none url('');
        }
        
        
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <ul>
        <li>This test passes if it does not crash.</li>
      </ul>
      <div class="box">
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());
}

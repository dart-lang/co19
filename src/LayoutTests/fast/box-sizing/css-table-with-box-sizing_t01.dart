/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test case for bug 89819. This tests CSS 'table' and
 * 'inline-table' with box-sizing.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        .test {
          width:120px;
          height:120px;
          border:10px solid black;
        }

        .border-box {
          box-sizing:border-box;
          -moz-box-sizing:border-box;
        }

            .content-box {
          box-sizing:content-box;
          -moz-box-sizing:content-box;
        }                     	

        .css-inline-table {
          display:inline-table;
        }

        .css-table {
          display:table;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="testContent">
        <p id="t1" class="test css-inline-table border-box">120x120<br>css-inline-table<br>border-box</p>
        <p id="t2" class="test css-table border-box">120x120<br>css-table<br>border-box</p>
        <p id="t3" class="test css-inline-table content-box">120x120<br>css-inline-table<br>content-box</p>
        <p id="t4" class="test css-table content-box">120x120<br>css-table<br>content-box</p>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("t1").offsetWidth, 120);
  shouldBe(document.getElementById("t1").offsetHeight, 120);
  shouldBe(document.getElementById("t2").offsetWidth, 120);
  shouldBe(document.getElementById("t2").offsetHeight, 120);
  shouldBe(document.getElementById("t3").offsetWidth, 140);
  shouldBe(document.getElementById("t3").offsetHeight, 140);
  shouldBe(document.getElementById("t4").offsetWidth, 140);
  shouldBe(document.getElementById("t4").offsetHeight, 140);

  document.getElementById("testContent").style.display = 'none';
}

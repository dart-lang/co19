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
      html {
          orphans:-988;
          widows: 435;
          -webkit-columns:1in auto ;
          width: 0;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <!-- This test is for crbug.com/327725. Need some long text for reproducing crash.-->
      <!-- Copied the following from W3C spec.-->
      The 'orphans' property specifies the minimum number of lines in a block container that must be left at the bottom of a page. The 'widows' property specifies the minimum number of lines in a block container that must be left at the top of a page. Examples of how they are used to control page breaks are given below.
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetLeft;
  document.body.innerHtml = 'PASS';
}

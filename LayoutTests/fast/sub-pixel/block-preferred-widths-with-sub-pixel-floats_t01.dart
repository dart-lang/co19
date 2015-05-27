/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that we don't cause an assertion failure on relayout
 * of nested positioned elements. This test pass if we don't cause an assertion failure.");
  */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style type="text/css">
#relativeContainer { position:relative; width:980px; height:58px; margin:18px auto 0; z-index:999; font-size:12px; }
#relativeContainer ul { position:absolute; right:200px; top:1px;  margin:0; }
#relativeContainer ul li { display:inline; float:left; margin:0 0 0 2.8em; background-color: green;}
#relativeContainer ul li a { display:block; color:#333; text-decoration:none; padding:.3em 0 .3em 5px; text-shadow: 0 1px 0 #fff; line-height:18px; }
</style>    
''';

const String htmlEL2 = r'''
<body>
<div id="relativeContainer">
  <ul>
    <li id="support"><a href="#">Support</a></li>
    <li id="membercenter"><a href="#">Member Center</a></li>
 </ul>
</div>
<p id="description"></p>
<div id="console"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    Expect.equals(document.getElementById("membercenter").offsetTop,
        document.getElementById("support").offsetTop
    );
}

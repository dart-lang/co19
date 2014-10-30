/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Reflections and hit testing
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
  <style type="text/css" media="screen">
    .reflected {
      display: inline-block;
      height: 100px;
      width: 100px;
      margin: 10px;
      background-color: gray;
      -webkit-box-reflect: below;
    }
    #results {
      margin-top: 120px;
    }
  </style>
''';

const String htmlEL2 = r'''
<body onload="runTest()">

<p>Tests for <a href="https://bugs.webkit.org/show_bug.cgi?id=24552">https://bugs.webkit.org/show_bug.cgi?id=24552</a></p>
<div class="reflected"></div>

<a id="link" href="http://www.example.com">Link here</a>

<div id="results"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body. setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var hitNode = document.elementFromPoint(160, 168);
    var link = document.getElementById('link');
    var results = document.getElementById('results');
    Expect.identical(hitNode, link);
}

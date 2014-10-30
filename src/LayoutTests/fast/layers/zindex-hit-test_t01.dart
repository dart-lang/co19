/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
  <style type="text/css">
  #main {
    position: absolute;
    top: 10px;
    left: 10px;
    width: 200px;
    height: 100px;
    z-index: -100;
    background-color: #eee;
  }
  #main:hover {
    background-color: orange;
  }
  
  #results {
    margin-top: 150px;
  }
  </style>
''';

const String htmlEL2 = r'''
    <div id="main">
      Div with z-index: -100
    </div>
    <div id="results">
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body. setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var hitElement = document.elementFromPoint(50, 50);
    var results = document.getElementById('results');
    var main = document.getElementById('main');
    Expect.identical(hitElement, main);
}

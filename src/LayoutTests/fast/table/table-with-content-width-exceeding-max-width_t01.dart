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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
#a {
  height: 100px; 
  max-width: 100px;
  width: 50px;
  background: red;
  display: table;
  font: 10px/1 Ahem;
}
</style>
    <div>This test checks that a table with 'width' and content wider than 'max-width' is not constrained.</div>
    <div id="a" data-expected-width="200">XXXXXXXXXXXXXXXXXXXX</div>
''';

const String htmlEL2 = r'''
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('#a');});
}

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
import "../../testharness.dart";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
#a {
  height: 100px; 
  max-width: 100px;
  width: 500px;
  background: red;
  display: table;
}
</style>
''';

const String htmlEL2 = r'''
    <div>This test checks that a table with 'width' exceeding 'max-width' is correctly constrained.</div>
    <div id="a" data-expected-width="100"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen((e){checkLayout('#a');});
}

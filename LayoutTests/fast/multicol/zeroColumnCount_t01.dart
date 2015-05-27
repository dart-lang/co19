/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test that column-count:0 is parsed as invalid syntax and thrown away. 
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
body {
    -webkit-column-count: 2;
    -webkit-column-count: 0;
}
</style>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    Expect.equals("2", document.body.getComputedStyle().columnCount);
}

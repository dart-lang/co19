/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Stray param elements are not dropped when parsing
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
        <p id="result">FAIL</p>
        <param>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e) {
        var len = document.getElementsByTagName("param").length;
        Expect.equals(1, len);
        document.getElementById("result").innerHtml = "PASS";
    });    
}

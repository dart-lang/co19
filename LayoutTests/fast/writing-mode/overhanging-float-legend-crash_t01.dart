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

const String htmlEL = r'''
    <div id="result"></div>
    <div id="block1">
        <span id="float1" style="float:left; margin-bottom:10000px;"></span>
    </div>
    <legend>
        <fieldset></fieldset>
        <junk>
    </legend>
''';

void crash(e)  {
    document.getElementById("block1").style.position = 'absolute';
    document.getElementById("float1").style.display = 'none';
    document.body.offsetTop;
    document.getElementById("result").text = "PASS";
}

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    window.onLoad.listen(crash);
}
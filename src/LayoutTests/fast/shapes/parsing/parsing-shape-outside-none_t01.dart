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
import "../../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style>
#target { shape-outside: url(//fail); }
#target { shape-outside: none; }
</style>
''';

const String htmlEL2 = r'''
<div id="target"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    Element target=document.getElementById("target");
    Expect.equals('none', target.getComputedStyle().shapeOutside, 'Test setting the none value for shape-outside');
}
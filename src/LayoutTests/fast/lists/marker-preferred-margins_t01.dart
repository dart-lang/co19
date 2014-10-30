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
li {
    float: left;
    border: 5px solid pink;
}
div {
    background-color: salmon;
    width: 20px;
    height: 20px;
}
</style>
''';

const String htmlEL2 = r'''
The list items should have no content.

<ul style="border:2px solid blue;">
    <li data-expected-width=10></li>
    <li data-expected-width=10></li>
</ul>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    checkLayout('ul');
}

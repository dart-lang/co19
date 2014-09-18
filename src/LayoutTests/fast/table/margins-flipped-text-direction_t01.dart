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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
<style>
div {
    position: relative;
    width: 600px;
}
table {
    margin-left: 10px;
    margin-right: 20px;
    width: 200px;
    border: 1px solid black;
}
</style>
''';

const String htmlEL2 = r'''
<div style="direction: ltr">
<table data-offset-x=10 style="direction: ltr">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-x=10 style="direction: rtl">
    <tr><td>Hello</td></tr>
</table>
</div>

<div style="direction: rtl">
<table data-offset-x=380 style="direction: ltr">
    <tr><td>Hello</td></tr>
</table>
<table data-offset-x=380 style="direction: rtl">
    <tr><td>Hello</td></tr>
</table>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('div');});
}

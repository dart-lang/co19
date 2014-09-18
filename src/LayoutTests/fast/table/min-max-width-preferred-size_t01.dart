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
.child {
    width: 75px;
    height: 20px;
    background-color: salmon;
    display: inline-block;
}
.container {
    display: inline-block;
    border: 5px solid grey;
}
table {
    background-color: pink;
}
</style>
''';

const String htmlEL2 = r'''
<div class="container" data-expected-width=210>
    <table style="max-width: 200px">
        <td>
            <div class="child"></div>
            <div class="child"></div>
            <div class="child"></div>
        </td>
    </table>
</div>
<br>

<div class="container" data-expected-width=210>
    <table style="width: 100px; min-width: 200px; table-layout: fixed"><td><div class="child"></div></td></table>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('.container');});
}

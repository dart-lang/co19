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
    table, tr, td {
        font: 26px/1 Ahem;
        border: 0px;
        padding: 0px;
        margin: 0px;
    }
    table {
        border-spacing: 2px;
    }
    </style>
''';

const String htmlEL2 = r'''
    <table id="table" data-expected-height="34"></table>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    for (var i = 0; i < 20; i++) {
        document.body.offsetHeight;
        var p = document.getElementById('table');
        p.setInnerHtml('<tr><td>Table</td></tr>');
        p.append(new Element.tag('tr'));
    }
    checkLayout('table');
}

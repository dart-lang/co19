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
#container {
    width: 1px;
}
#table {
    width: 300px;
    table-layout: fixed;
}
td {
    padding: 0;
}
.wide {
    width: 100px;
}
</style>
''';

const String htmlEL2 = r'''
    This test verifies table cell width is correctly updated after a table-layout change.
    <div id="container">
        <table id="table">
            <thead><tr><td data-expected-width="100"></td><td data-expected-width="100"></td><td class="wide" data-expected-width="100"></td></tr></thead>
            <tbody><tr><td data-expected-width="100"></td><td class="wide" data-expected-width="100"></td><td data-expected-width="100"></td></tr></tbody>
            <tfoot><tr><td class="wide" data-expected-width="100"></td><td data-expected-width="100"></td><td data-expected-width="100"></td></tr></tfoot>
        </table>
    </div>
    <div id="test-output"></div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    document.body.offsetTop;
    
    var container = document.getElementById('container');
    container.style.setProperty('width', '500px');
    
    var table = document.getElementById('table');
    table.style.setProperty('table-layout', 'auto');
    table.style.setProperty('width', 'auto');
    
    checkLayout("td", document.getElementById("test-output"));
}

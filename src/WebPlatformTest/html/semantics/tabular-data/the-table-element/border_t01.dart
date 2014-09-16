/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/border.html
 * @assertion
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#the-table-element" />
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#dom-table-border" />
 * @description The border attribute<
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''

    <table id="table1" style="display:none">
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table2" border="" style="display:none">
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table3" border="1" style="display:none">
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
''';

void check(String id, String expected) {
    test(() {
        var table1 = document.getElementById(id);
        assert_equals(table1.getAttribute("border"), expected);
    }, "The border IDL attribute reflects the content attribute of the same name (id=$id).");
}

void main() {
    document.body.appendHtml(htmlEL);

    check('table1', null);
    check('table2', "");
    check('table3', "1");
  
    checkTestFailures();
}

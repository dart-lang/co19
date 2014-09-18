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

const String htmlEL2 = r'''
    <div style="width: 2000px; position: absolute; left: -9000px;">
        <table style="background-color:blue"><tr><td>

            <table id="table" style="width:100%; background-color:green; table-layout:fixed;"><tr><td>
                Content
            </td></tr></table>

        </td></tr></table>

    </div>
    <span id="result">This test failed. </span>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var table = document.getElementById("table");
    Expect.equals("1994px", table.getComputedStyle(null).getPropertyValue("width")
        , "The width of the fixed table should be 1994px, which is based on the width of its containing div."
    );
    document.getElementById("result").text="Passed.";
}

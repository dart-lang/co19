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

const String htmlEL1 = r'''
<style>
    body{
        font-size: 16px;
        line-height: 26px;
        margin: 0px;
        padding: 0px;
    }
    table, td {
        margin: 0px;
        padding: 0px;
    }
</style>
''';

const String htmlEL2 = r'''
<table>
    <tbody><tr>
        <td width="200">
            pre-text<a href="https://bug-45164-attachments.webkit.org/" style="background-color:red;">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAL0AAABBCAIAAAAL5TIFAAAABGdBTUEAALGPC/xhBQAAAY5JREFUeF7t07ENA0EMBLFz/0XbbmEnFPj4UAqOGH3e+z4fgV3g342fwCogGgJFoOysbZq/J6AbAkWg7Ny7Hi9aBXRDoAiUnbVN8/cEdEOgCJSde9fjRauAbggUgbKztmn+noBuCBSBsnPverxoFdANgSJQdtY2zd8T0A2BIlB27l2PF60CuiFQBMrO2qb5ewK6IVAEys696/GiVUA3BIpA2VnbNH9PQDcEikDZuXc9XrQK6IZAESg7a5vm7wnohkARKDv3rseLVgHdECgCZWdt0/w9Ad0QKAJl5971eNEqoBsCRaDsrG2avyegGwJFoOzcux4vWgV0Q6AIlJ21TfP3BHRDoAiUnXvX40WrgG4IFIGys7Zp/p6AbggUgbJz73q8aBXQDYEiUHbWNs3fE9ANgSJQdu5djxetArohUATKztqm+XsCuiFQBMrOvevxolVANwSKQNlZ2zR/T0A3BIpA2bl3PV60CuiGQBEoO2ub5u8J6IZAESg7967Hi1YB3RAoAmVnbdP8PQHdENgFftJRFIIJq05RAAAAAElFTkSuQmCC" align="top">
            </a> after-text
        </td>
        <td>Something</td>
    </tr></tbody>
</table>
<br>
<p id="description"></p>
<div id="console"></div>
''';

void main() {
    document.body. setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    description('Tests for hitTest of <a> element <br/> <a href="https://bugs.webkit.org/show_bug.cgi?id=45164">bug 45164</a>: REGRESSION: <a><img align=top></a> Clickable area too large');
    var obj = document.elementFromPoint(15, 15);
    Expect.equals("a", obj.nodeName.toLowerCase());
}

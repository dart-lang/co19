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

const String htmlEL1 = r'''
<style>
    #scroll {
        width: 230px;
        height: 230px;
        overflow: scroll;
        border: 1px solid black;
    }
    #container {
        width:200px;
        height:200px;
        background-color:blue;
        -webkit-transform: rotate(180deg);
    }
    #spill {
        width:100px;
        height:100px;
        background-color:green;
        position:absolute;
        top:-50px;
    }
</style>
''';

const String htmlEL2 = r'''
    <div id="scroll">
        <div id="container">
            <div id="spill"></div>
        </div>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var scroll = document.getElementById("scroll");
    var scrollHeight = scroll.scrollHeight;
    Expect.isTrue(scrollHeight > 215);
}

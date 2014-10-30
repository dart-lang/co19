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
        #wrap {
        position: absolute;
        width: 800px;
        height: 200px;
        border: 2px solid black;
        left:0;
        top:0;
    }
    
    #outer {
        position: absolute;
        display: inline-block;
        width:200px;
        height:200px;
        background-color:grey;
    }
    
    #outer2 {
        display: inline-block;
        width:200px;
        height:200px;
        background-color:blue;
    }

    #inner {
        width: 100px;
        height: 100px;
        background-color:green;
        position: fixed; top:2px;
    }
    
    #outer p {
        margin-left: 110px;
    }
</style>
''';

const String htmlEL2 = r'''
    <div id='wrap'>
        <div id='outer2'></div>
        <div id='outer'>
            <div id='inner'></div>
            <p>Foo</p>
        </div>
    </div>
    <div id="output">Failure</div>    
''';

void measure() {
    Expect.equals(2, document.getElementById('inner').offsetLeft); 
    var output = document.getElementById("output");
    output.text = "Success";
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var outer = document.getElementById("outer2");
    outer.remove();
    measure();
}

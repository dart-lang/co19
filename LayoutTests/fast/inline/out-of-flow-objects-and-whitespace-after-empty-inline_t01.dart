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
            body > span {
                display: inline-block;
                vertical-align: top;
                font: 20px/1 Ahem;
            }
            .container-absolute > label > span {
                padding: 5px;
                position: absolute;
            }
            .container-float > label > span {
                padding: 5px;
                float: left;
            }
            input {
                border-top: 0px;
                border-bottom: 0px;
                margin-top: 0px;
                margin-bottom: 0px;
                padding-top: 0px;
                padding-bottom: 0px;
            }
        </style>
''';

const String htmlEL2 = r'''
        <p>webkit.org/p/114311: The text should be inside the input controls. </p>
        <span id="id1" class="container-absolute" data-expected-height="20px"><label for="input-field"><span>Input</span></label>    <input id="input-field" type="text"></span>
        <span id="id2" class="container-float" data-expected-height="30px"><label for="input-field"><span>Input</span></label>    <input id="input-field" type="text"></span>
        <span id="id3" class="container-absolute" data-expected-height="20px"><label for="input-field"><span>Input</span></label> <input id="input-field" type="text"></span>
        <span id="id4" class="container-float" data-expected-height="30px"><label for="input-field"><span>Input</span></label> <input id="input-field" type="text"></span>
        <span id="id5" class="container-absolute" data-expected-height="20px"><label for="input-field"><span>Input</span></label><input id="input-field" type="text"></span>
        <span id="id6" class="container-float" data-expected-height="30px"><label for="input-field"><span>Input</span></label><input id="input-field" type="text"></span>
        <span id="id7" class="container-absolute" data-expected-height="20px">
            <label for="input-field"><span>Input</span></label>
            <input id="input-field" type="text">
        </span>
        <span id="id8" class="container-float" data-expected-height="30px">
            <label for="input-field"><span>Input</span></label>
            <input id="input-field" type="text">
        </span>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout('#id1');
    checkLayout('#id2');
    checkLayout('#id3');
    checkLayout('#id4');
    checkLayout('#id5');
    checkLayout('#id6');
    checkLayout('#id7');
    checkLayout('#id8');
}

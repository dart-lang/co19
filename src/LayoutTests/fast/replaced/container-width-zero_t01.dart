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
            #leftBar {
                margin-right: 2500px;
            }
            #largeVideo {
                width: 100%;
                background-color: red;
            }
        </style>
''';

const String htmlEL2 = r'''
        <p> crbug.com/235189: If our container's width is zero, then so is ours: there should be no red.<p>
        <div id="leftBar">
            <video id="largeVideo" data-expected-width=0></video>
        </div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    checkLayout('#largeVideo');
}

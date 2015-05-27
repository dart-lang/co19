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

const String htmlEL1 = r'''
<style>
    ruby::before {
        display: block;
        content: url("does-not-exist");
    }
</style>
''';

const String htmlEL2 = r'''
<ruby>
    <ruby>
        <ruby>
            <style>
                ruby {
                    float: right;   
                }
            </style>
        </ruby>
    </ruby>
</ruby>
This test passes if it doesn't crash.
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
}

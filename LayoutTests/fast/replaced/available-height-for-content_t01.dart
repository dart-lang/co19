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
        div { width: 200px; min-height: 1px; height: 20px; border: 1px solid green; padding: 50px;}
        img { margin:0; padding:0; border:0; width:100%; height: 100%; background: silver}
    </style>
''';

const String htmlEL2 = r'''
<p>Ensure we calculate the available height for replaced content correctly.</p>
<div>
    <img src="" data-expected-height=20>
</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    checkLayout('img');
}

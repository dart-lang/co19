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
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<span id="test" style="-webkit-writing-mode:vertical-lr"></span>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());
    var elt = document.getElementById('test');
    Expect.equals("inline-block", elt.getComputedStyle().getPropertyValue("display"));
}
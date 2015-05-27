/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test passes if it does not crash.
 */
import "dart:html";

const String htmlEL2 = r'''
<input type="range" value=0>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    document.querySelector(":in-range").style.setProperty("-webkit-mask-composite", "source-over");
    document.querySelector(":in-range").style.paddingBottom="9223372036854775808em";
}

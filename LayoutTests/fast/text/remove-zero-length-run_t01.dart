/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test that regional indicator symobol letters can combine into national flags.
 * @needsreview fails with offset=6, as the original test does.
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
﻿<div style="position: absolute; top: 40px; left: 40px; width: 140px; font-family: Ahem; font-size: 20px; direction: rtl;">12345 abcde</div>''';

void main() {
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var offset = document.caretRangeFromPoint(125, 50).startOffset;
    Expect.equals(2, offset);
}

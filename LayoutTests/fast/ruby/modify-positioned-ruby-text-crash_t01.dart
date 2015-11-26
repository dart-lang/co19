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

const String htmlEL1 = r'''
<style>
*{word-break:inherit;text-rendering:optimizeLegibility;}
.fixedNavDown{nav-down:#;position:fixed; }
</style>
''';

const String htmlEL2 = r'''
<ruby><rt class="fixedNavDown">A</rt></ruby>
    This test passes if it doesn't crash.
''';

void doTest(e) {
    var oSelection=window.getSelection();
    document.execCommand("SelectAll", false, null);
    var oRange = oSelection.getRangeAt(0);
    var oDocumentFragment = oRange.extractContents();

    document.body.append(new Text('PASS, if no assert or crash in debug'));
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(doTest);
}
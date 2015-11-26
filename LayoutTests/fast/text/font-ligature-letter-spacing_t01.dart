/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Letter spacing and Ligature
 */
import "../../testharness.dart";

const String htmlEL1 = '''
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<style type="text/css">
@font-face {
  font-family: megalopolis;
  src: url($testSuiteRoot/third_party/MEgalopolis/MEgalopolisExtra.woff) format("woff");
}

.dligDiv {
-moz-font-feature-settings:"frac" 1, "dlig" 1;
-moz-font-feature-settings:"frac=1, dlig=1";
-ms-font-feature-settings:"frac" 1, "dlig" 1;
-o-font-feature-settings:"frac" 1, "dlig" 1;
-webkit-font-feature-settings:"frac" 1, "dlig" 1;
font-feature-settings:"frac" 1, "dlig" 1;
}

.common {
font-size: 24px;
line-height: 100%;
padding: 0px;
letter-spacing:20px;
font-family: megalopolis;
}

p { font-family: serif; font-style: italic; }
</style>
''';

const String htmlEL2 = r'''
<div class="dligDiv common">
    <span class="dligSpan">CACACACA</span>
</div>

<div class="common">
    <span class="letterSpace">CACACACA</span>
</div>
''';

void testLetterSpaceAndLigature(e) {
    var elementWidthWithLigatureAndLetterSpacing = (document.getElementsByClassName("dligSpan")[0] as Element).getBoundingClientRect().width;
    var elementWidthWithLetterSpacing = (document.getElementsByClassName("letterSpace")[0] as Element).getBoundingClientRect().width;
    Expect.equals(elementWidthWithLetterSpacing,
                  elementWidthWithLigatureAndLetterSpacing,
                  "Ligature not applied due to letter spacing.");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
//    setup({ explicit_done: true });
    window.onLoad.listen(testLetterSpaceAndLigature);
}

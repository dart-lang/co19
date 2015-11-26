/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Ligature Linebreaking
 */
import "../../testharness.dart";

const String htmlEL1 = '''
<style type="text/css">
@font-face {
  font-family: megalopolis;
  src: url($testSuiteRoot/third_party/MEgalopolis/MEgalopolisExtra.woff) format("woff");
}

body { 
font-family: megalopolis, sans-serif; 
}

.dlig {
-moz-font-feature-settings:"frac" 1, "dlig" 1; 
-moz-font-feature-settings:"frac=1, dlig=1"; 
-ms-font-feature-settings:"frac" 1, "dlig" 1; 
-o-font-feature-settings:"frac" 1, "dlig" 1; 
-webkit-font-feature-settings:"frac" 1, "dlig" 1; 
font-feature-settings:"frac" 1, "dlig" 1;
font-size: 24px;
line-height: 100%;
padding: 0px;
}

p { font-family: serif; font-style: italic; }

.container {
width: 180px;
background-color: lightpink;
}

</style>
''';

const String htmlEL2 = r'''
<div class="dlig container" >CACACACA CACACACA</div>
<div id="log"></div>
''';

void testLetterSpaceAndLigature(e) {
    Expect.isTrue(document.querySelector('.dlig').clientHeight <= 24, "Ligature words laid out in one line.");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
//    setup({ explicit_done: true });
    window.onLoad.listen(testLetterSpaceAndLigature);
}

/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Ligature Linebreaking
 */
import "../../testcommon.dart" as tc;
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
width: 1.4em;
background-color: lightpink;
word-wrap: break-word;
}

</style>
''';

const String htmlEL2 = r'''
<div class="dlig container">CACA</div>
''';

void testLetterSpaceAndLigature(e) {
    var clientHeight=document.querySelector('.dlig').clientHeight;
    Expect.isTrue(clientHeight <= 24, "Two ligatures laid out in one line: clientHeight = $clientHeight");
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
//    setup({ explicit_done: true });
    tc.addOnLoadListener((_) {
      testLetterSpaceAndLigature(_);
    });
}

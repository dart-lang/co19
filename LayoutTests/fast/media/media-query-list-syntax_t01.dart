/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Media Query List syntax
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
    <style id="sheet">/**/</style>
    <link rel="author" title="Rune Lillesveen" href="mailto:rune@opera.com">
    <link rel="help" href="http://www.w3.org/TR/css3-mediaqueries/#syntax">
''';

const String htmlEL2 = r'''
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2);
    var tests = [
        [ "@media all, not,{}", "all, not all, not all" , "Media query error #1" ],
        [ "@media screen, all and f() {}", "screen, not all", "Media query error #2" ],
        [ "@media not and (color), #screen, screen {}", "not all, not all, screen", "Media query error #3" ],
        [ "@media all; @media tv {}", "tv", "Media query error #4" ],
        [ "@media ({ block, }), tv {}", "not all, tv", "Media query error #5" ],
        [ "@media screen and(color), tv {}", "not all, tv", "Media query error #6" ],
        [ "@media all and (color) and (f() {}), tv {}", "not all, tv", "Media query error #7" ],
        [ "@media tv, all or (nothing) {}", "tv, not all", "Media query error #8" ],
        [ "@media tv, all and (color) tv {}", "tv, not all", "Media query error #9" ]
    ];
    CharacterData cdataNode = document.getElementById("sheet").firstChild as CharacterData;
    for (int i=0; i < tests.length; i++) {
        cdataNode.data = tests[i][0];
        String result;
        List<CssRule> cssRules = (document.styleSheets[0] as CssStyleSheet).cssRules;
        test((){
            Expect.isTrue(cssRules.length > 0, "cssRules.length==0");
            int tp = cssRules[0].type;
            Expect.equals(4, tp,  "cssRule.type=$tp");
            String mediaText = (cssRules[0] as CssMediaRule).media.mediaText;
            Expect.equals(tests[i][1], mediaText,  "cssRule.media.mediaText=$mediaText");
        }, tests[i][2]);
    }

    checkTestFailures();
}

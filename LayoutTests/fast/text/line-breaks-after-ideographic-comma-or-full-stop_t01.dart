/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Line breaks after ideographic comma or full stop
 */
import "../../testharness.dart";

const String htmlEL2 = '''
        These are good:
        <div style="font-family:'Lucida Grande'; font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid green 1px;">
                &#x3046;&#x3001;<br>texttexttexttext
            </p>
            <p style="border:solid green 1px;">
                &#x3046;&#x3002;<br>texttexttexttext
            </p>
        </div>
        The following two should look like &ldquo;good&rdquo;:
        <div style="font-family:'Lucida Grande'; font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid blue 1px;">
                &#x3046;&#x3001;texttexttexttext
            </p>
            <p style="border:solid blue 1px;">
                &#x3046;&#x3002;texttexttexttext
            </p>
        </div>
        These are bad:
        <div style="font-family:'Lucida Grande'; font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid red 1px;">
                <nobr>&#x3046;&#x3001;texttexttexttext</nobr>
            </p>
            <p style="border:solid red 1px;">
                <nobr>&#x3046;&#x3002;texttexttexttext</nobr>
            </p>
        </div>
''';

String paragraphHeight(int paragraphNumber) {
    Element el = document.getElementsByTagName("p")[paragraphNumber];
    return el.getComputedStyle().getPropertyValue("height");
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Expect.equals(paragraphHeight(0), paragraphHeight(2), "0 2");
    Expect.equals(paragraphHeight(1), paragraphHeight(3), "1 3");
}
/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Line breaks after closing punctuations
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
        These are good:
        <div style="font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid green 1px;">
                (111111)<br>(222222)
            </p>
            <p style="border:solid green 1px;">
                [111111]<br>[222222]
            </p>
        </div>
        </div>
        The following two should look like &ldquo;good&rdquo;:
        <div style="font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid blue 1px;">
                (111111)(222222)
            </p>
            <p style="border:solid blue 1px;">
                [111111][222222]
            </p>
        </div>
        These are bad:
        <div style="font-size:16pt; text-decoration:underline; width:5em;">
            <p style="border:solid red 1px;">
                <nobr>(111111)(222222)</nobr>
            </p>
            <p style="border:solid red 1px;">
                <nobr>[111111][222222]</nobr>
            </p>
        </div>
''';

String paragraphHeight(paragraphNumber) {
    Element el = document.getElementsByTagName("p")[paragraphNumber];
    return el.getComputedStyle().getPropertyValue("height");
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Expect.equals(paragraphHeight(0), paragraphHeight(2), "0 2");
    Expect.equals(paragraphHeight(1), paragraphHeight(3), "1 3");
}

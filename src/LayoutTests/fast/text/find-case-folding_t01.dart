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

bool canFind(String target, String specimen) {
    window.getSelection().empty();
    document.body.setInnerHtml(specimen);
    document.execCommand("FindString", false, target);
    bool result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    return result;
}

void runTests(e)  {
    var smallSharpS = new String.fromCharCode(0xDF);

    shouldBeTrue(canFind("Stra${smallSharpS}e", "Stra${smallSharpS }e"),
        "Cannot find small sharp s when searching for small sharp s."
    );

    // Added an "x" to the start of the target string to work around an ICU bug.
    // See <http://bugs.icu-project.org/trac/ticket/6671> for details.
    shouldBeTrue(canFind("Strasse", "xStra${smallSharpS }e"),
        "Cannot find small sharp s when searching for ss."
    );

    shouldBeTrue(canFind("Stra${smallSharpS }e", "Strasse"),
        "Cannot find ss when searching for small sharp s."
    );

    shouldBeTrue(canFind("Strasse", "Strasse"),
        "Cannot find ss when searching for ss."
    );
    checkTestFailures();
}

void main() {
    window.onLoad.listen(runTests);
}

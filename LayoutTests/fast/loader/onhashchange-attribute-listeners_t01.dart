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

const String htmlEL2 = r'''
This test makes sure that the various methods of setting an onhashchange handler all work as expected.<br>
Clicking the links below manually should also result in the event being fired when the hash actually changes.<br>
<a href="#">Go to empty hash</a><br>
<a href="#someHash">Go to non-empty hash</a><br>
<a name="#">Empty hash anchor</a><br>
<a name="#someHash">Non-empty hash anchor</a>
''';

void startTest(e) {
    window.location.hash = '#'; // Transitioning from no hash to an empty hash should not generate an event.
    window.location.hash = '#someHash'; // This actually reflects a changed hash and should generate an event.
}

void bodyInlineAttribute(e) {
    document.body.onHashChange.listen(bodyAssignedAttribute);
    window.location.hash = '#';
}

void bodyAssignedAttribute(e) {
    print("<body> assigned attribute called.");
    window.onHashChange.listen(windowAttribute);
    window.location.hash = '#someHash';
}

void windowAttribute(e) {
    print("window.onhashchange attribute called.");
    asyncEnd();
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onHashChange.listen(bodyInlineAttribute);
    window.onLoad.listen(startTest);
}

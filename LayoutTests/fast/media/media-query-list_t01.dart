/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test CSSOM View module: MediaQueryList interface
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
    <p>Test the MediaQueryList interface: <a href="http://dev.w3.org/csswg/cssom-view/#the-mediaquerylist-interface" title="CSSOM View Module">http://dev.w3.org/csswg/cssom-view/#the-mediaquerylist-interface</a>.</p>
    <div id="results">
    </div>
''';

void testQuery(query, expected) {
    shouldBe(window.matchMedia(query).matches, expected, query);
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    testQuery('screen', true);
    testQuery('projection', false);

    testQuery('all and (color)', true);
    testQuery('not projection and (color)', true);
    testQuery('(color)', true);
    testQuery('(color', true);
    testQuery('color', false);

    testQuery('garbage', false);

    testQuery('(min-device-width: 100px)', true);
    testQuery('(min-device-width: 50000px)', false);
    checkTestFailures();
    document.getElementById('results').innerHtml = 'Passed.';
}

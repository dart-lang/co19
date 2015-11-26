/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test CSSOM View module: Media interface
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style type="text/css">

</style>
''';

const String htmlEL2 = r'''
  <p>Test the media interface: <a href="http://dev.w3.org/csswg/cssom-view/#the-media-interface" title="CSSOM View Module">http://dev.w3.org/csswg/cssom-view/#the-media-interface</a>.</p>
  <div id="results">
    
  </div>
''';

void testQuery(query, expected)  {
    shouldBe(window.styleMedia.matchMedium(query), expected, query);
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
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
}

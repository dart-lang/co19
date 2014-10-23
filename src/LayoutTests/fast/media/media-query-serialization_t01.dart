/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test media query serialization.
 * <a href="https://bugs.webkit.org/show_bug.cgi?id=39220">https://bugs.webkit.org/show_bug.cgi?id=39220</a>
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<link rel="help" href="http://dev.w3.org/csswg/cssom/" />
<style type="text/css" media="NOT braille, tv and (orientation: landscape) AND (min-WIDTH:100px) and (max-width: 200px ), all and (color) and (color)">
</style>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    var expected = "not braille, tv and (max-width: 200px) and (min-width: 100px) and (orientation: landscape), (color)";
    List styleSheets=document.styleSheets;
    Expect.equals(expected, styleSheets[styleSheets.length-1].media.mediaText);
}
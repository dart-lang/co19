/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/xslt-transform-to-fragment-crash.html
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {

var style = r'''
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      <xsl:variable name="test"></xsl:variable>
      <xsl:variable name="test"></xsl:variable>
    </xsl:stylesheet>
''';

var xslp = new XsltProcessor();
var foo = new DomParser().parseFromString(style, "text/xml");
xslp.importStylesheet(foo);
xslp.transformToFragment(foo, document);
xslp.transformToFragment(foo, document);
}
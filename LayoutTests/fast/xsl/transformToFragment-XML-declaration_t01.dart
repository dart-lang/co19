/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/transformToFragment-XML-declaration.html
 * @description Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=10419">bug 10419</a>:
 * XsltProcessor transformToFragment fails because of an XML declaration.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
    var xml = (new DomParser()).parseFromString('<doc/>', 'application/xml');
    var xsl = (new DomParser()).parseFromString(
        '<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">' +
        '<xsl:output method="xml" omit-xml-declaration="no"/>' +
        ' <xsl:template match="doc"><p>1</p><p>2</p></xsl:template>' +
        '</xsl:stylesheet>', 
        'application/xml');

    var p = new XsltProcessor();
    p.importStylesheet(xsl);

    var ownerDocument = document.implementation.createDocument("", "doc", null);
    var f = p.transformToFragment(xml, ownerDocument);
    var result = (new XmlSerializer()).serializeToString(f);
    result = result.substring(0, 16); // remove the trailing newline, if present

    Expect.equals("<p>1</p><p>2</p>", result);

}
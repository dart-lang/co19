/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/xslt-fragment-in-empty-doc.html
 * @description This test checks whether XsltProcessor.transformToFragment() does not crash
 * when the target document does not have a root node.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
    var xml = (new DomParser()).parseFromString('<doc/>', 'application/xml');
    var xsl = (new DomParser()).parseFromString(
        '<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">' +
        '<xsl:output method="xml" omit-xml-declaration="yes"/>' +
        ' <xsl:template match="doc">SUCCESS</xsl:template>' +
        '</xsl:stylesheet>', 
        'application/xml');
    
    var p = new XsltProcessor();
    p.importStylesheet(xsl);
    var ownerDocument = document.implementation.createDocument("", "", null);
    var f = p.transformToFragment(xml, ownerDocument);
    
    // Firefox throws an exception here, while WebKit doesn't:
    // "An attempt was made to create or change an object in a way which is incorrect with regard to namespaces."
    ownerDocument = document.implementation.createDocument("", null, null);
    f = p.transformToFragment(xml, ownerDocument);
}
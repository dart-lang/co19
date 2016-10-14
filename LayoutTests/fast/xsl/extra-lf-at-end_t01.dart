/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/extra-lf-at-end.html
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=15919">bug 15919</a>:
 * XsltProcessor.transformToFragment creates an extra not defined TEXT_NODE at the end.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
    XsltProcessor oProc = new XsltProcessor();

    var oStylesheet = new DomParser().parseFromString(
    r'<?xml version="1.0" encoding="UTF-8"?>' +
    '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
        '<xsl:output method="xml" omit-xml-declaration="yes" />'+
        '<xsl:param name="text" select="\'default\'" />'+
        '<xsl:template match="/">'+
            r'<div><xsl:value-of select="$text" /></div>'+
            '<br />'+
        '</xsl:template>'+
    '</xsl:stylesheet>', 'text/xml');

    oProc.importStylesheet(oStylesheet);
    Document document = new DomParser().parseFromString('<root />', 'text/xml');

    oProc.setParameter('', 'text', 'Hello World!');

    DocumentFragment oResult = oProc.transformToFragment(oStylesheet, document);

    Expect.equals(Node.DOCUMENT_FRAGMENT_NODE, oResult.nodeType, 'should of type DOCUMENT_FRAGMENT_NODE(11)');
// was:    Expect.equals('Hello World!', oProc.getParameter(null, 'text') ... see dart issue #20223
    Expect.equals('Hello World!', oProc.getParameter('', 'text'), 'getParameter should return the correct value');
    Expect.equals('div', oResult.firstChild.nodeName, 'can have multiple children, firstchild should be the div');
    Expect.equals('br', oResult.lastChild.nodeName, 'can have multiple children, lastchild should be the br');
    Expect.equals('Hello World!', (oResult.firstChild as Element).text, 'textContent should be set to parameter value');
}
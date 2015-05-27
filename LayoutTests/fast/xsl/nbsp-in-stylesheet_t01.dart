/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/nbsp-in-stylesheet.html
 * @description Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=19215">bug 19215</a>:
 * XSLT transformToDocument fails when stylesheet contains &amp;#160;
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {

    var XML = '<?xml version="1.0" encoding="utf-8" ?>'+
              '<libraries xmlns:xhtml="http://www.w3.org/1999/xhtml">'+
              '</libraries>';
    
    var XSL = '<?xml version="1.0" encoding="UTF-8" ?>'+
    '<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"'+
    '                xmlns="http://www.w3.org/1999/xhtml"'+
    '                version="1.0">'+
    '    <xsl:template match="/">'+
    '        <html xmlns="http://www.w3.org/1999/xhtml" lang="en"'+
    '              xml:lang="en">'+
    '            <head>'+
    '                <title>'+
    '                </title>'+
    '            </head>'+
    '            <body foo="&#160;">'+
              '&#160;'+
    '            </body>'+
    '        </html>'+
    '    </xsl:template>'+
    '</xsl:stylesheet>';
    
    var parser = new DomParser();
    var d = parser.parseFromString(XML, "text/xml");
    parser = new DomParser();
    var xsl = parser.parseFromString(XSL, "text/xml");
    
    var xsltproc =  new XsltProcessor();
    xsltproc.importStylesheet(xsl);
    var result = xsltproc.transformToDocument(d);

    Expect.isNotNull(result);
}
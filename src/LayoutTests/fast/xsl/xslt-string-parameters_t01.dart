/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/xslt-string-parameters.html
 * @description This tests that passing string parameters to the XsltProcessor works as expected.
 * @needsreview dart issue #20223
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

const stylsheetString=r'''
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/><xsl:param name="testParam"/> 
<xsl:template match="/test"><xsl:value-of select="$testParam"/></xsl:template></xsl:stylesheet>
''';
                           
main() {
        
    var sourceDoc = (new DomParser()).parseFromString('<test/>', 'text/xml');
    var sheetDoc = (new DomParser()).parseFromString(stylsheetString, 'text/xml');
                           
    var processor = new XsltProcessor();
    processor.importStylesheet(sheetDoc);

// was:   processor.setParameter(null, 'testParam', 'text');
    processor.setParameter('', 'testParam', 'text');
        return;
    var result = processor.transformToFragment(sourceDoc, document);
    Expec.equals('text', result.textContent);

    processor.setParameter('', 'testParam', 'text with spaces');
    result = processor.transformToFragment(sourceDoc, document);
    Expec.equals('text with spaces', result.textContent);
 
    processor.setParameter('', 'testParam', 'Shakespeare\'s "Twelfth Night"');
    result = processor.transformToFragment(sourceDoc, document);
    Expec.equals('Shakespeare\'s "Twelfth Night"', result.textContent);
}
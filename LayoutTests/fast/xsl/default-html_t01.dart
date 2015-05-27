/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after /LayoutTests/fast/xsl/default-html.html
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=11694">bug 11694</a>:
 * XSLT output method does not default to HTML when the target document is HTML
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<div id="result">Should be green: </div>
<div id="result2">Should be black: </div>
''';

main() {
    document.body.appendHtml(htmlEL);

    var xsl = (new DomParser()).parseFromString('<?xml version="1.0" encoding="ISO-8859-1"?>'+
    '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
    '<xsl:template match="doc">'+
    '<span style="color:green">result.</span>'+
    '</xsl:template>'+
    '</xsl:stylesheet>', 'application/xml');
    
    var xsl2 = (new DomParser()).parseFromString('<?xml version="1.0" encoding="ISO-8859-1"?>'+
    '<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
    '<xsl:output method="xml"/>'+
    '<xsl:template match="doc">'+
    '<span style="color:green">result.</span>'+
    '</xsl:template>'+
    '</xsl:stylesheet>', 'application/xml');
    
    var xml = (new DomParser()).parseFromString('<?xml version="1.0" encoding="ISO-8859-1"?>'+
    '<doc/>', 'application/xml');
    
    var processor = new XsltProcessor();
    processor.importStylesheet(xsl);
    var result = processor.transformToFragment(xml, document);
    
    document.getElementById("result").append(result);
    
    // The HTML default shouldn't override an explicitly specified method.
    processor = new XsltProcessor();
    processor.importStylesheet(xsl2);
    var result2 = processor.transformToFragment(xml, document);
    document.getElementById("result2").append(result2);

    Expect.equals("green", (document.getElementById("result").childNodes[1] as Element).style.color);
    Expect.isNotNull((document.getElementById("result2").childNodes[1] as Element).style);
}


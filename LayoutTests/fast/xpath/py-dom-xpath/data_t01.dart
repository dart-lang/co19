/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../xpath-test-pre.dart";

class MyXPathNSResolver implements XPathNSResolver {
    String lookupNamespaceUri(String prefix) {
        return 'http://foo.com';
    }
}

void main() {
var doc = (new DomParser()).parseFromString(r'''
    <doc xmlns:a="http://www.example.com/a">    
        <element attribute="&quot;value&quot;">&lt;text&gt;</element>    
        followed    
        <?processing  instruction ?>    
        by    
        <!-- comment -->    
        more text    
        <a:item attribute="1" a:attribute="2" />    
    </doc>''',
    'application/xml');
    
var nsResolver = new MyXPathNSResolver();

test(doc, doc.documentElement, 'normalize-space(/)', "<text> followed by more text", nsResolver);
test(doc, doc.documentElement, 'name(/)', "", nsResolver);
test(doc, doc.documentElement, 'local-name(/)', "", nsResolver);
test(doc, doc.documentElement, 'namespace-uri(/)', "", nsResolver);

test(doc, doc.documentElement, 'normalize-space(/doc)', "<text> followed by more text", nsResolver);

test(doc, doc.documentElement, 'string(//a:item)', "", nsResolver);
test(doc, doc.documentElement, 'name(//a:item)', "a:item", nsResolver);
test(doc, doc.documentElement, 'local-name(//a:item)', "item", nsResolver);
test(doc, doc.documentElement, 'namespace-uri(//a:item)', "http://www.example.com/a", nsResolver);

test(doc, doc.documentElement, 'string(//@attribute)', '\"value\"', nsResolver);
test(doc, doc.documentElement, 'name(//@a:attribute)', 'a:attribute', nsResolver);
test(doc, doc.documentElement, 'local-name(//@a:attribute)', 'attribute', nsResolver);
test(doc, doc.documentElement, 'namespace-uri(//@a:attribute)', 'http://www.example.com/a', nsResolver);

test(doc, doc.documentElement, 'string(//processing-instruction())', 'instruction ', nsResolver);
test(doc, doc.documentElement, 'name(//processing-instruction())', 'processing', nsResolver);
test(doc, doc.documentElement, 'local-name(//processing-instruction())', 'processing', nsResolver);
test(doc, doc.documentElement, 'namespace-uri(//processing-instruction())', '', nsResolver);

test(doc, doc.documentElement, 'string(//comment())', ' comment ', nsResolver);
test(doc, doc.documentElement, 'name(//comment())', '', nsResolver);
test(doc, doc.documentElement, 'local-name(//comment())', '', nsResolver);
test(doc, doc.documentElement, 'namespace-uri(//comment())', '', nsResolver);

test(doc, doc.documentElement, 'string(//element/text())', '<text>', nsResolver);
test(doc, doc.documentElement, 'name(//element/text())', '', nsResolver);
test(doc, doc.documentElement, 'local-name(//element/text())', '', nsResolver);
test(doc, doc.documentElement, 'namespace-uri(//element/text())', '', nsResolver);

    checkTestFailures();    
}
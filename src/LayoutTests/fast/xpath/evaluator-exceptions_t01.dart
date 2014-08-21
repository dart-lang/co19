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
import "xpath-test-pre.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var nsResolver = evaluator.createNSResolver(document);
/*
    shouldThrow((){
      evaluator.evaluate('/body', 0, nsResolver, 0, null);
     });
*/
    var fragment = document.createDocumentFragment(); 
    shouldThrow(() {
      evaluator.evaluate('/body', fragment, nsResolver, 0, null);
    });

// was:    var doctype = document.doctype;  
    var doctype = document.implementation.createDocumentType('svg:svg', '-//W3C//DTD SVG 1.1//EN', 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd');
    shouldThrow((){
       evaluator.evaluate('/body', doctype, nsResolver, 0, null);
    });
    
    checkTestFailures();
}


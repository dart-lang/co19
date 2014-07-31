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
import 'package:html5lib/dom.dart';
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var nsResolver = evaluator.createNSResolver(document);

    shouldThrow((){
      evaluator.evaluate('/body', 0, nsResolver, 0, null);
     });

    var fragment = document.createDocumentFragment(); 
    shouldThrow(() {
      evaluator.evaluate('/body', fragment, nsResolver, 0, null);
    });

// was:    var doctype = document.doctype;  
    DocumentType doctype = new DocumentType("","","");
    shouldThrow((){
       evaluator.evaluate('/body', doctype, nsResolver, 0, null);
    });
    
}


/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=11815">bug 11815</a>:
 * XPathEvaluator behavior does not match Firefox - substring() and empty element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    var strXML = '<data><record></record><record>-hi-</record></data>';
    var doc = (new DomParser()).parseFromString(strXML, "text/xml");
    var xpe = new XPathEvaluator();
    var objResult = xpe.evaluate("//record[substring(.,1,1)='-']", doc, null, 0, null);
    var itm = null;
    var objNodes = [];
    while ((itm = objResult.iterateNext())!=null) {
       objNodes.add(itm);
    }

    Expect.equals(1, objNodes.length);
}
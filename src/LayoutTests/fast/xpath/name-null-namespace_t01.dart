/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12340">bug 12340</a>:
 * XPath name() function doesn't work with nodes and attributes in null namespace.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();

    String strXML = '<doc><record/><record/><record/><record/><record foo="a-a"/></doc>';
    Document doc = (new DomParser()).parseFromString(strXML, "text/xml");
    
    // This matches in both Firefox and WebKit, which indicates that 
    // XPathEvaluator does not normalize the document.
    (doc.firstChild.childNodes[0] as Element).setAttributeNS("bar", "foo", "-a-");
    
    // This doesn't match.
    (doc.firstChild.childNodes[1] as Element).setAttributeNS("bar", "b:foo", "-a-");
    
    // These both match, too.
    (doc.firstChild.childNodes[2] as Element).setAttributeNS("", "foo", "-a-");
    (doc.firstChild.childNodes[3] as Element).setAttributeNS(null, "foo", "-a-");
    
    // The last (static) record matches, of course.
    
    
    var xpe = new XPathEvaluator();
    var objResult = xpe.evaluate("//@*[name()='foo']", doc, null, 0, null);
    var itm = null;
    var objNodes = [];
    while ((itm = objResult.iterateNext())!=null)
      objNodes.add(itm);

    Expect.equals(4, objNodes.length);
}
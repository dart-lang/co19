/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p> Test for bug Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=23956">23956</a>: Safari crashes when clone fails (cloning a XML element with an invalid nodeName)</p>
    <p> For this test to pass, it should not crash and you should see PASS twice.</p>
    <div id='log'/>
    ''', treeSanitizer: new NullTreeSanitizer());

  log(s)
  {
    var logDiv = document.getElementById("log");
    logDiv.append(new Text(s));
    logDiv.append(document.createElement('br'));
  }

  matches(node, clonedNode, passedMessage)
  {
    if (node.localName == clonedNode.localName
        //&& node.prefix == clonedNode.prefix
        && node.namespaceUri == clonedNode.namespaceUri
        && node.nodeName == clonedNode.nodeName)
      log("PASS: " + passedMessage);
    else
      log("FAIL");
  }

  var xmlDoc = document.implementation
    .createDocument("http://www.example.com", "foo:bar", null);

  var xmlNode = xmlDoc.createElement("foo:bar");
  var clonedXMLNode = xmlNode.clone(false);  // WebKit crashes.
  var htmlNode = document.getElementById('log');
  var clonedHTMLNode = htmlNode.clone(false);

  matches(xmlNode, clonedXMLNode, "Cloned XML node matches the original");
  matches(htmlNode, clonedHTMLNode, "Cloned HTML node matches the original");
}

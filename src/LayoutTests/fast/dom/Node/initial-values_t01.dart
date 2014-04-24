/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test creation of each type of Node and check intial values
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
    var xmlDoc = 
      document.implementation.createDocument(
          "http://www.w3.org/1999/xhtml", "html", null);

    //... skipped NA to dart tests

  var comment = new Comment("foo");
  shouldBe(comment.nodeName, '#comment');
  //shouldBe(comment.localName, null);
  //shouldBe(comment.namespaceUri, null);
  shouldBe(comment.nodeValue, 'foo');
  shouldBe(comment.data, 'foo');

  var fragment = document.createDocumentFragment();
  shouldBe(fragment.nodeName, '#document-fragment');
  //shouldBe(fragment.localName, null);
  //shouldBe(fragment.namespaceUri, null);
  shouldBe(fragment.nodeValue, null);

  var doc =
    document.implementation.createDocument(
        "http://www.w3.org/1999/xhtml", "html", null);

  shouldBe(doc.nodeName, '#document');
  //shouldBe(doc.localName, null);
  // Spec: http://www.w3.org/TR/DOM-Level-2-Core/core.html#Level-2-Core-DOM-createDocument
  // Currently both FF and WebKit return null here, disagreeing with the spec
  //shouldBe(doc.namespaceUri, 'http://www.w3.org/1999/xhtml');
  shouldBe(doc.nodeValue, null);

  var doctype = 
    document.implementation.createDocumentType(
        "svg", "-//W3C//DTD SVG 1.1//EN",
        "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd");
  shouldBe(doctype.nodeName, 'svg');
  //shouldBe(doctype.name, 'svg');
  //shouldBe(doctype.localName, null);
  //shouldBe(doctype.namespaceUri, null);
  shouldBe(doctype.nodeValue, null);

  debug("Element creation using createElement on an HTML doc:");
  var element = document.createElement("pre");
  shouldBe(element.nodeName, 'PRE');
  // Spec: http://www.w3.org/TR/DOM-Level-2-Core/core.html#Level-2-Core-DOM-createElement
  // FF returns "PRE" for localName, WebKit returns "pre", the spec says we should return null
  shouldBe(element.localName, null);
  // FF returns null for namespaceUri, WebKit returns http://www.w3.org/1999/xhtml, the spec says we should return null
  shouldBe(element.namespaceUri, null);
  shouldBe(element.nodeValue, null);

  debug("Prefixed element creation using createElementNS on an HTML doc:");
  element = document.createElementNS("http://www.w3.org/1999/xhtml", "html:pre");
  shouldBe(element.nodeName, 'html:pre');
  shouldBe(element.localName, 'pre');
  shouldBe(element.namespaceUri, 'http://www.w3.org/1999/xhtml');
  shouldBe(element.nodeValue, null);

  debug("SVG Element creation using createElementNS on an HTML doc:");
  element = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  shouldBe(element.nodeName, 'svg');
  shouldBe(element.localName, 'svg');
  shouldBe(element.namespaceUri, 'http://www.w3.org/2000/svg');
  shouldBe(element.nodeValue, null);

  debug("Unknown Element creation using createElementNS on an HTML doc:");
  element = document.createElementNS("http://www.webkit.org", "foo:svg");
  shouldBe(element.nodeName, 'foo:svg');
  shouldBe(element.localName, 'svg');
  shouldBe(element.namespaceUri, 'http://www.webkit.org');
  shouldBe(element.nodeValue, null);

  debug("Element creation using createElementNS on an HTML doc:");
  element = document.createElementNS("http://www.w3.org/1999/xhtml", "pre");
  // Spec: http://www.w3.org/TR/DOM-Level-3-Core/core.html#ID-104682815 (element.tagName)
  // FF and Opera returns "pre" for nodeName as it is an XHTML element, WebKit returns "PRE".
  shouldBe(element.nodeName, 'pre');
  shouldBe(element.localName, 'pre');
  shouldBe(element.namespaceUri, 'http://www.w3.org/1999/xhtml');
  shouldBe(element.nodeValue, null);

  debug("Element creation using createElement on an XHTML doc:");
  element = xmlDoc.createElement("pre");
  shouldBe(element.nodeName, 'pre');
  shouldBe(element.localName, null);
  // FF returns null for namespaceUri, WebKit returns http://www.w3.org/1999/xhtml, the spec says we should return null
  shouldBe(element.namespaceUri, null);
  shouldBe(element.nodeValue, null);

  debug("Element creation using createElementNS on an XHTML doc:");
  element = xmlDoc.createElementNS("http://www.w3.org/1999/xhtml", "html:pre");
  shouldBe(element.nodeName, 'html:pre');
  shouldBe(element.localName, 'pre');
  shouldBe(element.namespaceUri, 'http://www.w3.org/1999/xhtml');
  shouldBe(element.nodeValue, null);

  debug("Text node creation using createTextNode on an HTML doc:");
  var text = new Text("foo");
  shouldBe(text.nodeName, '#text');
  //shouldBe(text.localName, null);
  //shouldBe(text.namespaceUri, null);
  shouldBe(text.nodeValue, 'foo');
  shouldBe(text.data, 'foo');
}


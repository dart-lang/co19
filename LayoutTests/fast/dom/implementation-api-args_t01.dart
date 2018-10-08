/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that the DOMImplementation api arguments are correctly
 * validated
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  validateDocument(document, prototype, namespace, qualifiedName)
  {
    if (prototype == 'XmlDocument')
      shouldBeTrue(document is XmlDocument);
    else
      shouldBeTrue(document is HtmlDocument);

    if (qualifiedName == null || qualifiedName == "") {
      shouldBeNull(document.documentElement);
    } else {
      shouldBeEqualToString(document.documentElement.tagName, qualifiedName);
      if (namespace != null)
        shouldBeEqualToString(document.documentElement.namespaceUri, namespace);
      else
        shouldBeNull(document.documentElement.namespaceUri);
    }
  }

  debug('\nDocumentType createDocumentType(DOMString qualifiedName, DOMString publicId, DOMString systemId);');
  testImpl(document.implementation, "qualifiedName", "qualifiedName", "publicId");

  var docType;
  shouldNotThrow(() => docType = document.implementation.createDocumentType("qualifiedName", "publicId", "systemId"));
  //shouldBeTrue(docType is DocumentType);
  //shouldBeEqualToString(docType.name, 'qualifiedName');
  //shouldBeEqualToString(docType.publicId, 'publicId');
  //shouldBeEqualToString(docType.systemId, 'systemId');

  debug('\nXMLDocument createDocument(DOMString? namespace, [TreatNullAs=EmptyString] DOMString qualifiedName, DocumentType? doctype);');
  testImpl(document.implementation, "namespace", "namespace", "qualifiedName");

  var doc;
  shouldNotThrow(() => doc = document.implementation.createDocument("namespace", "qualifiedName", null));
  validateDocument(doc, 'XmlDocument', 'namespace', 'qualifiedName');
  shouldNotThrow(() => doc = document.implementation.createDocument(null, "qualifiedName", null));
  validateDocument(doc, 'XmlDocument', null, 'qualifiedName');
  shouldNotThrow(() => doc = document.implementation.createDocument("", null, null));
  validateDocument(doc, 'XmlDocument', "", null);
  shouldNotThrow(() => doc = document.implementation.createDocument("", "", null));
  validateDocument(doc, 'XmlDocument', "", "");

  //shouldNotThrow(() => doc = document.implementation.createDocument("namespace", "qualifiedName"));
  //validateDocument(doc, 'XmlDocument', "namespace", "qualifiedName");
  shouldNotThrow(() => doc = document.implementation.createDocument("namespace", "qualifiedName", docType));
  validateDocument(doc, 'XmlDocument', "namespace", "qualifiedName");

  debug('\nDocument createHtmlDocument(optional DOMString title);');
  //shouldNotThrow(() => doc = document.implementation.createHtmlDocument());
  //validateDocument(doc, 'HtmlDocument', "http://www.w3.org/1999/xhtml", "HTML");
  shouldNotThrow(() => doc = document.implementation.createHtmlDocument("title"));
  validateDocument(doc, 'HtmlDocument', "http://www.w3.org/1999/xhtml", "HTML");
}

testImpl(dynamic impl, String name1, String name2, String id) {
  _shouldThrow1(func)
  => shouldThrow(func, (e) => e is NoSuchMethodError);

  _shouldThrow1(() => impl.createDocumentType());
  _shouldThrow1(() => impl.createDocumentType("qualifiedName"));
  _shouldThrow1(() => impl.createDocumentType("qualifiedName", "publicId"));
}
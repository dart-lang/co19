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

  _shouldThrow1(func)
    => shouldThrow(func, (e) => e is NoSuchMethodError);

  debug('\nDocumentType createDocumentType(DOMString qualifiedName, DOMString publicId, DOMString systemId);');
  _shouldThrow1(() => document.implementation.createDocumentType());
  _shouldThrow1(() => document.implementation.createDocumentType("qualifiedName"));
  _shouldThrow1(() => document.implementation.createDocumentType("qualifiedName", "publicId"));

  var docType;
  shouldNotThrow(() => docType = document.implementation.createDocumentType("qualifiedName", "publicId", "systemId"));
  //shouldBeTrue(docType is DocumentType);
  //shouldBeEqualToString(docType.name, 'qualifiedName');
  //shouldBeEqualToString(docType.publicId, 'publicId');
  //shouldBeEqualToString(docType.systemId, 'systemId');

  debug('\nXMLDocument createDocument(DOMString? namespace, [TreatNullAs=EmptyString] DOMString qualifiedName, DocumentType? doctype);');
  _shouldThrow1(() => document.implementation.createDocument());
  _shouldThrow1(() => document.implementation.createDocument("namespace"));
  _shouldThrow1(() => document.implementation.createDocument("namespace", "qualifiedName"));

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

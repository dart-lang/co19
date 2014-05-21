/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that XMLSerializer quotes the attribute characters
 * specified in <a href="https://dvcs.w3.org/hg/innerhtml/raw-file/tip/index.html#dfn-concept-serialize-xml-attributes">the W3C spec</a>.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var attrValue = '< > & " \' \xA0';

  // HTML case.
  // DOM parsing and serialization defers to the HTML specification: http://www.w3.org/html/wg/drafts/html/master/syntax.html#attribute's-serialized-name
  // Steps 1-3 under the "Escaping a string" heading are relevant to attributes.
  var htmlElement = document.createElement('div');
  htmlElement.setAttribute('quoteme', attrValue);
  shouldBe(htmlElement.outerHtml,
      """<div quoteme="< > &amp; &quot; ' &nbsp;"></div>""");

  // XML case.
  // DOM parsing and serialization: https://dvcs.w3.org/hg/innerhtml/raw-file/tip/index.html#dfn-concept-serialize-xml-attributes
  // Step 2 substep 4 is relevant to attributes.
  var xmlDocument = document.implementation
    .createDocument('http://www.w3.org/1999/xhtml', 'html', null);
  var xmlElement = xmlDocument.createElement('div');
  xmlElement.setAttribute('quoteme', attrValue);
  shouldBe((new XmlSerializer()).serializeToString(xmlElement),
    """<div xmlns="http://www.w3.org/1999/xhtml" quoteme="&lt; &gt; &amp; &quot; ' \xA0"></div>""");
}

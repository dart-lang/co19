/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test HTMLTemplateElement content ownerDocument in XHTML Document
 * @needsreview
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
        <!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml">
        <template></template>''',
        'text/xml');

  shouldBeFalse(doc is HtmlDocument);
  var template3 = doc.querySelector('template');
  var templateContentOwnerDocument = template3.content.ownerDocument;
  shouldNotBe(doc, templateContentOwnerDocument);
  shouldBeFalse(templateContentOwnerDocument is HtmlDocument);

  var template4 = doc.createElement('template');
  templateContentOwnerDocument = template4.content.ownerDocument;
  shouldNotBe(doc, templateContentOwnerDocument);
  shouldBeFalse(templateContentOwnerDocument is HtmlDocument);
}

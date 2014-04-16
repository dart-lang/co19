/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test HTMLTemplateElement content ownerDocument
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <template id="template"><span><template></template></span></template>
    <template id="template2"><span></span></template>
    <template id="template3"><svg></svg></template>
    ''', treeSanitizer: new NullTreeSanitizer());

  var template = document.getElementById('template');
  shouldBe(template.ownerDocument, document);

  //var content = template.content;
  //var df = document.createDocumentFragment();
  //template.content = df; //NA to dart
  //shouldBe(template.content, content);

  var templateContentOwnerDocument = template.content.ownerDocument;
  shouldBeTrue(templateContentOwnerDocument is HtmlDocument);
  shouldNotBe(document, templateContentOwnerDocument);
  shouldBe(template.content.firstChild.ownerDocument, templateContentOwnerDocument);

  var innerTemplate = template.content.firstChild.firstChild;
  shouldBe(innerTemplate.ownerDocument, templateContentOwnerDocument);
  shouldBe(innerTemplate.content.ownerDocument, templateContentOwnerDocument);
  shouldBeTrue(innerTemplate.ownerDocument is HtmlDocument);

  var template2 = document.getElementById('template2');
  shouldBe(template2.ownerDocument, document);
  shouldBe(template2.content.ownerDocument, templateContentOwnerDocument);

  var template3 = document.getElementById('template3');
  shouldBe(template3.ownerDocument, document);
  shouldBe(template3.content.ownerDocument, templateContentOwnerDocument);
  shouldBe(template3.content.firstChild.ownerDocument, templateContentOwnerDocument);
}


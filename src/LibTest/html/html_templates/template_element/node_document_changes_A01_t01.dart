/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When a template element's node document changes, the template
 * element's content DocumentFragment must be adopted into the new node
 * document's template contents owner document.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test empty template', () {
    var doc1 = newHtmlDocument();
    var template = doc1.createElement('template');
    Expect.equals(doc1, template.ownerDocument);
    Expect.equals(doc1, template.content.ownerDocument);
  
    var doc2 = newHtmlDocument();
    var template2 = doc2.createElement('template');
    doc2.body.append(template);
    Expect.equals(template2.ownerDocument, template.ownerDocument);
    Expect.equals(template2.content.ownerDocument, template.content.ownerDocument);
  });

  test('Test not empty template', () {
    var doc1 = newHtmlDocument();
    doc1.body.innerHtml = '<template id="tmpl"><div>Div content</div>'
      'And some more text</template>';
    var template = doc1.querySelector('#tmpl');

    Expect.equals(doc1, template.ownerDocument);
    Expect.equals(doc1, template.content.ownerDocument);

    var doc2 = newHtmlDocument();
    var template2 = doc2.createElement('template');
    doc2.body.append(template);

    Expect.equals(template2.ownerDocument, template.ownerDocument);
    Expect.equals(template2.content.ownerDocument, template.content.ownerDocument);
    Expect.equals(template2.content.ownerDocument,
        template.content.querySelector('div').ownerDocument);
  });

  test('Test nested template', () {
    var doc1 = newHtmlDocument();
    doc1.body.innerHtml =
      '<template id="tmpl"><div>Div content</div> And some more text'
      '<template id="tmpl2"><div>Template content</div></template>'
      '</template>';

    var template = doc1.querySelector('#tmpl');

    Expect.equals(doc1, template.ownerDocument);
    Expect.equals(doc1, template.content.ownerDocument);

    var nestedTemplate = template.content.querySelector('#tmpl2');

    Expect.equals(doc1, nestedTemplate.ownerDocument);
    Expect.equals(doc1, nestedTemplate.content.ownerDocument);

    var doc2 = newHtmlDocument();
    var template2 = doc2.createElement('template');
    doc2.body.append(template);

    Expect.equals(template2.ownerDocument, template.ownerDocument);
    Expect.equals(template2.content.ownerDocument, template.content.ownerDocument);
    Expect.equals(template2.content.ownerDocument,
        template.content.querySelector('div').ownerDocument);

    Expect.equals(template2.content.ownerDocument, nestedTemplate.ownerDocument);
    Expect.equals(template2.content.ownerDocument, nestedTemplate.content.ownerDocument);
    Expect.equals(template2.content.ownerDocument,
        nestedTemplate.content.querySelector('div').ownerDocument);
  });
}

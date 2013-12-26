/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ownerDocument property of the element appended to template must
 * be set to the template contents owner of the ownerDocument of the template
 * element.
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  test('Test template element inside the div', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml =
      '<div><template id="tmpl1"><div id="div">DIV</div></template></div>';

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    Expect.equals(template.content.ownerDocument, div.ownerDocument,
        'Wrong ownerDocument of the element in template');
  });

  test('Test template element in the root of the body', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml =
      '<template id="tmpl1"><div id="div">DIV</div></template>';

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    Expect.equals(template.content.ownerDocument, div.ownerDocument,
        'Wrong ownerDocument of the element in template');
  });


  test('Test template element in the root of the head', () {
    var doc = newHtmlDocument();
    doc.head.innerHtml =
    '<template id="tmpl1"><div id="div">DIV</div></template>';

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    Expect.equals(template.content.ownerDocument, div.ownerDocument,
    'Wrong ownerDocument of the element in template');
    });

  test('Test template element in the root of the frameset', () {
    var doc = newHtmlDocument();

    //doc.open();
    //doc.write();
    //doc.close();

    doc.body.innerHtml =
      '<frameset><template id="tmpl1"><div id="div">DIV</div></template></frameset>';

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    Expect.equals(template.content.ownerDocument, div.ownerDocument,
        'Wrong ownerDocument of the element in template');
  });

  test('Test ownerDocument property of the element in a nested template', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml =
      '<template id="tmpl1">'
      '<template id="tmpl2"><div id="div">DIV</div></template></template>';

    var template = doc.querySelector('#tmpl1');

    var nestedTemplate = template.content.querySelector('#tmpl2');

    Expect.equals(template.content.ownerDocument, nestedTemplate.ownerDocument,
        'Wrong nested template owner document');

    var div = nestedTemplate.content.querySelector('#div');

    Expect.equals(nestedTemplate.content.ownerDocument, div.ownerDocument,
        'Wrong div ownerDocument');
  });

  var elements = HTML5_ELEMENTS.toSet()
    .difference(['body', 'html', 'head', 'frameset'].toSet());

  for (var value in elements) {
    test('Test ownerDocument property of $value element in a template', () {
  
      var doc = newHtmlDocument();

      if (isVoidElement(value)) {
        doc.body.setInnerHtml(
            '<template><$value/></template>',
            treeSanitizer: new NoCheck());
      } else {
        doc.body.setInnerHtml(
            '<template><$value></$value></template>',
            treeSanitizer: new NoCheck());
      }

      var template = doc.querySelector('template');
      var element = template.content.querySelector(value);

      doc.body.append(template);

      Expect.equals(template.content.ownerDocument, element.ownerDocument);
    });
  }
}
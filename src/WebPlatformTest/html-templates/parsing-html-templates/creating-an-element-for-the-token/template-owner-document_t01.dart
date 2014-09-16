/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion ownerDocument property of the element appended to template must 
 * be set to the template contents owner of the ownerDocument of the template
 * element
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {

  test(() {
    var doc = newHTMLDocument();
    doc.body.setInnerHtml('<div><template id="tmpl1"><div id="div">DIV</div></template></div>',
      treeSanitizer: new NullTreeSanitizer());

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    assert_equals(div.ownerDocument, template.content.ownerDocument,
      'Wrong ownerDocument of the element in template');

  }, 'Test ownerDocument property of the element in a template. '
  + 'Current DOCUMENT has no browsing context. Test template element inside the div');



  test(() {
    var doc = newHTMLDocument();
    doc.body.setInnerHtml('<template id="tmpl1"><div id="div">DIV</div></template>',
      treeSanitizer: new NullTreeSanitizer());

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    assert_equals(div.ownerDocument, template.content.ownerDocument,
      'Wrong ownerDocument of the element in template');

  }, 'Test ownerDocument property of the element in a template. '
  + 'Current DOCUMENT has no browsing context. Test template element '
  + 'in the root of the body');



  test(() {
    var doc = newHTMLDocument();
    doc.head.setInnerHtml('<template id="tmpl1"><div id="div">DIV</div></template>',
      treeSanitizer: new NullTreeSanitizer());

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    assert_equals(div.ownerDocument, template.content.ownerDocument,
      'Wrong ownerDocument of the element in template');

  }, 'Test ownerDocument property of the element in a template. '
  + 'Current DOCUMENT has no browsing context. Test template element '
  + 'in the root of the head');



  test(() {
    var doc = newHTMLDocument();

    doc.open();
    doc.write('<frameset><template id="tmpl1"><div id="div">DIV</div></template></frameset>');
    doc.close();

    var template = doc.querySelector('#tmpl1');

    var div = template.content.querySelector('#div');

    assert_equals(div.ownerDocument, template.content.ownerDocument,
      'Wrong ownerDocument of the element in template');

  }, 'Test ownerDocument property of the element in a template. '
  + 'Current DOCUMENT has no browsing context. Test template element '
  + 'in the root of the frameset');



  test(() {
    var doc = newHTMLDocument();
    doc.body.setInnerHtml('<template id="tmpl1">'
      + '<template id="tmpl2"><div id="div">DIV</div></template></template>',
      treeSanitizer: new NullTreeSanitizer());

    var template = doc.querySelector('#tmpl1');

    var nestedTemplate = template.content.querySelector('#tmpl2');

    assert_equals(nestedTemplate.ownerDocument, template.content.ownerDocument,
      'Wrong nested template owner document');

    var div = nestedTemplate.content.querySelector('#div');

    assert_equals(div.ownerDocument, nestedTemplate.content.ownerDocument,
      'Wrong div ownerDocument');

  }, 'Test ownerDocument property of the element in a nested template');


  var parameters = [];

  HTML5_ELEMENTS.forEach((value) {
    if (value != 'body' && value != 'html' && value != 'head' && value != 'frameset') {

      var doc = newHTMLDocument();

      if (isVoidElement(value)) {
        doc.body.setInnerHtml('<template><' + value + '/></template>',
          treeSanitizer: new NullTreeSanitizer());
      } else {
        doc.body.setInnerHtml('<template><' + value + '></' + value + '></template>',
          treeSanitizer: new NullTreeSanitizer());
      }

      var template = doc.querySelector('template');
      var element = template.content.querySelector(value);

      doc.body.append(template);

      parameters.add([
        'Test ownerDocument for the element ' + value + ' in the template',
        element,
        template
        ]);
    }
  });

  compare_owners(element, template) {
    assert_equals(element.ownerDocument, template.content.ownerDocument);
  }

  generate_tests(compare_owners, parameters,
      'Test ownerDocument property of all HTML5 elements in a template. '
      + 'Current DOCUMENT has no browsing context.');

}

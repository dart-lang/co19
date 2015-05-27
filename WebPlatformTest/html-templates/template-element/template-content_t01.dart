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
 * @assertion Template may contain any element, except the html element, the 
 * head element, the body element, or the frameset element
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {

  var parameters = [];

  HTML5_ELEMENTS.forEach((value) {
    if (value != 'body' && value != 'html' && value != 'head' && value != 'frameset') {

      var doc = newHTMLDocument();
      var template = doc.createElement('template');
      var element = doc.createElement(value);
      template.content.append(element);
      var valueToTest = template.content.querySelector(value);

      doc.body.append(template);

      parameters.add([
        'Template may contain ' + value + ' element',
        valueToTest,
        null
        ]);
    }
  });

  generate_tests(assert_not_equals, parameters,
      'Template may contain any element, except the html element, '
      + 'the head element, the body element, or the frameset element');




  parameters = [];

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

      parameters.add([
        'Template may contain ' + value + ' element. '
        +'The template element and contents are added via body.innerHtml',
        element,
        null
        ]);
    }
  });

  generate_tests(assert_not_equals, parameters,
      'Template may contain any element, except the html element, '
      + 'the head element, the body element, or the frameset element. '
      +'The template element and contents are added via body.innerHtml');
}


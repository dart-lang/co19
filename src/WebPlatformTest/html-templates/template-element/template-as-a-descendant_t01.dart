/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Template element can be a descendant of the body element
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

templateIsAChild(element) {
    element.innerHtml = '<template>some text</template>';

    assert_not_equals(element.querySelector('template'), null,
        'Template element should be a descendant of the ' + element.tagName + ' element');
}

templateIsAnIndirectChild(element) {
    element.innerHtml = '<div><template>some text</template></div>';

    assert_not_equals(element.querySelector('template'), null,
        'Template element should be a descendant of the ' + element.tagName + ' element');
}

templateIsAnAppendedChild(doc, element) {
    var template = doc.createElement('template');

    element.append(template);

    assert_not_equals(element.querySelector('template'), null,
        'Template element should be a descendant of the ' + element.tagName + ' element');
}

templateIsAnAppendedIndirectChild(doc, element) {
    var template = doc.createElement('template');
    var div = doc.createElement('div');
    div.append(template);

    element.append(div);

    assert_not_equals(element.querySelector('template'), null,
        'Template element should be a descendant of the ' + element.tagName + ' element');
}

main() {

  var doc = newHTMLDocument();
  var frameset = doc.createElement('frameset');

  var parameters = [['Template element as a descendant of the BODY element. ' +
    'Template element is created by innerHtml',
    doc.body],
    ['Template element as a descendant of the HEAD element. ' +
      'Template element is created by innerHtml',
    doc.head],
    ['Template element as a descendant of the FRAMESET element. ' +
      'Template element is created by innerHtml',
    frameset]
    ];
  generate_tests(templateIsAChild, parameters,
      'Template element as a descendant of the HEAD, BODY and FRAMESET elements');



  parameters = [['Template element as an indirect descendant of the BODY element. ' +
    'Template element is created by innerHtml',
    doc.body],
    ['Template element as an indirect descendant of the HEAD element. ' +
      'Template element is created by innerHtml',
    doc.head],
    ['Template element as an indirect descendant of the FRAMESET element. ' +
      'Template element is created by innerHtml',
    frameset]
    ];
  generate_tests(templateIsAnIndirectChild, parameters,
      'Template element as an indirect descendant of the HEAD, BODY and FRAMESET elements');



  parameters = [['Template element as a descendant of the BODY element. ' +
    'Template element is appended by append()',
    doc, doc.body],
    ['Template element as a descendant of the HEAD element. ' +
      'Template element is appended by append()',
    doc, doc.head],
    ['Template element as a descendant of the FRAMESET element. ' +
      'Template element is  appended by append()',
    doc, frameset]
    ];
  generate_tests(templateIsAnAppendedChild, parameters,
      'Template element as a descendant of the HEAD, BODY and FRAMESET elements');



  parameters = [['Template element as an indirect descendant of the BODY element. ' +
    'Template element is appended by append()',
    doc, doc.body],
    ['Template element as an indirect descendant of the HEAD element. ' +
      'Template element is appended by append()',
    doc, doc.head],
    ['Template element as an indirect descendant of the FRAMESET element. ' +
      'Template element is  appended by append()',
    doc, frameset]
    ];
  generate_tests(templateIsAnAppendedIndirectChild, parameters,
      'Template element as a descendant of the HEAD, BODY and FRAMESET elements');
}


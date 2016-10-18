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
 * @assertion Template element can be a descendant of the body element
 */

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


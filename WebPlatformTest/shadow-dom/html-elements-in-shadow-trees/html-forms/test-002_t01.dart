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
 * @assertion HTML Elements in shadow trees: Form elements and form-associated 
 * elements in shadow tree must be accessible using shadow tree accessors
 */

import '../../testcommon.dart';

main() {
  //test form-associated elements
  test(() {
    var d = newHTMLDocument();

    var form = d.createElement('form');
    form.setAttribute('id', 'form_id');
    d.body.append(form);

    var div = d.createElement('div');
    d.body.append(div);
    var s = createSR(div);


    HTML5_FORM_ASSOCIATED_ELEMENTS.forEach((tagName) {

      var el = d.createElement(tagName);
      el.setAttribute('form', 'form_id');
      el.setAttribute('id', tagName + '_id');
      s.append(el);

      assert_true(s.querySelector('#' + tagName + '_id') != null, 'Form-associated element ' + tagName +
        ' in shadow tree must be accessible shadow tree accessors');
      assert_equals(s.querySelector('#' + tagName + '_id').getAttribute('id'), tagName + '_id',
        'Form-associated element ' + tagName + ' in shadow tree must be accessible shadow tree accessors');
    });
  }, 'A_08_02_02_T01');


  //test form elements
  test(() {
    var d = newHTMLDocument();

    var form = d.createElement('form');
    d.body.append(form);

    var div = d.createElement('div');
    form.append(div);
    var s = createSR(div);

    HTML5_FORM_ASSOCIATED_ELEMENTS.forEach((tagName) {

      var el = d.createElement(tagName);
      el.setAttribute('id', tagName + '_id');
      s.append(el);

      assert_true(s.querySelector('#' + tagName + '_id') != null, 'Form-associated element ' + tagName +
        ' in shadow tree must be accessible shadow tree accessors');
      assert_equals(s.querySelector('#' + tagName + '_id').getAttribute('id'), tagName + '_id',
        'Form element ' + tagName +	' in shadow tree must be accessible shadow tree accessors');
    });
  }, 'A_08_02_02_T02');


  //test distributed form elements
  test(() {
    var d = newHTMLDocument();

    HTML5_FORM_ASSOCIATED_ELEMENTS.forEach((tagName) {

      var form = d.createElement('form');
      d.body.append(form);

      var div = d.createElement('div');
      form.append(div);

      var el = d.createElement(tagName);
      el.setAttribute('id', tagName + '_id');
      div.append(el);

      var s = createSR(div);
      s.setInnerHtml('<content select="' + tagName + '"></content>',
        treeSanitizer: new NullTreeSanitizer());

      assert_true(s.querySelector('#' + tagName + '_id') == null, 'Distributed form-associated element ' + tagName +
        ' in shadow tree must not be accessible shadow tree accessors');
    });
  }, 'A_08_02_02_T03');
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * The nodes with a unique id and named elements are addressable from any
 * attributes of elements in the same shadow DOM subtree
 * 
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // check for label.control
  test(() {
    var d = newHtmlDocument();
    var div = d.createElement('div');
    d.body.append(div);
    var s = createSR(div);

    var input = d.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('id', 'input_id');
    d.body.append(input);

    var label = d.createElement('label');
    label.setAttribute('for', 'input_id');
    s.append(label);
    s.append(input);

    Expect.equals(input, label.control,
      'Elements in shadow DOM must be accessible from ' +
      'shadow document label.for attribute');
  }, 'A_04_01_07_T01');

  // check for elem.form associated elements
  test(() {
    HTML5_FORM_ASSOCIATED_ELEMENTS.forEach((tagName) {
      var d = newHtmlDocument();

      var form = d.createElement('form');
      var el = d.createElement(tagName);

      d.body.append(form);
      d.body.append(el);

      form.setAttribute('id', 'form_id');
      el.setAttribute('form', 'form_id');

      var div = d.createElement('div');
      d.body.append(div);

      var s = createSR(div);
      s.append(form);
      s.append(el);

      Expect.equals(form, el.form,
        'Elements in shadow DOM must be accessible from ' +
        'shadow document ' + tagName + '.form attribute');
    });
  }, 'A_04_01_07_T02');
}

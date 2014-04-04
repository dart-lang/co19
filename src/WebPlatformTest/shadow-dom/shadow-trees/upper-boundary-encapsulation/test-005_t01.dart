/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * The nodes with a unique id and named elements are not addressable from any
 * attributes of elements in shadow host's document
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // check label.for attribute
  test(() {
    var d = newHtmlDocument();
    var div = d.createElement('div');
    d.body.append(div);
    var s = createSR(div);

    // node in shadow with id
    var input = d.createElement('input');
    input.setAttribute('type', 'text');
    input.setAttribute('id', 'input_id');
    d.body.append(input);
    s.append(input);

    // node in host with a reference to host element with id
    var label = d.createElement('label');
    label.setAttribute('for', 'input_id');
    d.body.append(label);

    Expect.isNull(label.control,
      'Elements in shadow DOM must not be accessible from ' +
      'owner\'s document label.for attribute');
  }, 'A_04_01_05_T01');

  // check form associated elements
  test(() {
    HTML5_FORM_ASSOCIATED_ELEMENTS.forEach((tagName) {
      var d = newHtmlDocument();
      var div = d.createElement('div');
      d.body.append(div);
      var s = createSR(div);

      var form = d.createElement('form');
      form.setAttribute('id', 'form_id');
      d.body.append(form);

      var el = d.createElement(tagName);
      el.setAttribute('form', 'form_id');
      d.body.append(el);

      s.append(form);

      Expect.isNull(el.form,
        'Elements in shadow DOM must not be accessible from ' +
        'owner\'s document ' + tagName + '.form attribute');
    });
  }, 'A_04_01_05_T02');
}


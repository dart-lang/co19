/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node document of the template content attribute must be template
 * contents owner
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');
    template.append(nestedTemplate);

    assert_equals(nestedTemplate.content.ownerDocument, template.content.ownerDocument,
      'Wrong node document of the template content attribute');

  }, 'Node document of the template content attribute must be template contents owner. ' +
  'Nested template element created by createElement');


  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template><template></template></template>';
    var template = doc.querySelector('template');
    var nestedTemplate = template.content.querySelector('template');

    assert_equals(nestedTemplate.content.ownerDocument, template.content.ownerDocument,
      'Wrong node document of the template content attribute');

  }, 'Node document of the template content attribute must be template contents owner. ' +
  'Nested template element created by innerHtml');
}


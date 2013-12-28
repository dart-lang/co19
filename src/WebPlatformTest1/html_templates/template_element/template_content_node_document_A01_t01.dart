/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node document of the template content attribute must be
 * template contents owner.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test when template element created by createElement', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    Expect.equals(doc, template.content.ownerDocument);
  });

  test('Test when template element created via innerHtml', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template></template>';
    var template = doc.querySelector('template');

    Expect.equals(doc, template.content.ownerDocument);
  });

  test('Test when nested template element created by createElement', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');
    template.append(nestedTemplate);

    Expect.equals(doc, nestedTemplate.content.ownerDocument);
  });

  test('Test when nested template element created by innerHtml', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template><template></template></template>';
    var template = doc.querySelector('template');
    var nestedTemplate = template.content.querySelector('template');

    Expect.equals(doc, nestedTemplate.content.ownerDocument);
  });
}
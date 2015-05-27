/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for http://bugs.webkit.org/show_bug.cgi?id=11692
 * If the title has been explicitly set via document.title, any further
 * <title> tags parsed should not effect the document title.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var doc;

  createTitleElement(title)
  {
    var t = doc.createElement('title');
    t.append(new Text(title));
    return t;
  }

  var parser = new DomParser();
  doc = parser.parseFromString('<!DOCTYPE html><head></head><body></body>',
      'text/html');

  var head = doc.getElementsByTagName('head')[0];

  Expect.equals('', doc.title);
  head.append(createTitleElement('First title'));
  Expect.equals('First title', doc.title);
  doc.title = 'Second title';
  Expect.equals('Second title', doc.title);
  head.append(createTitleElement('Third title'));
  Expect.equals('Second title', doc.title);
  doc.title = 'Fourth title';
  Expect.equals('Fourth title', doc.title);

  //var titles = head.getElementsByTagName('title');
  var titles = head.querySelectorAll('title');
  titles[0].remove();
  Expect.equals('Third title', doc.title);
  titles[1].remove();
  Expect.equals('', doc.title);

  head.append(createTitleElement('Fifth title'));
  Expect.equals('Fifth title', doc.title);
}

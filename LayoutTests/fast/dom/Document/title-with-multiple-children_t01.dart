/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see if setting document.title works even
 * if the title element has multiple children.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var parser = new DomParser();
  HtmlDocument doc = parser.parseFromString('<!DOCTYPE html><head></head><body></body>',
      'text/html');

  // Setup - create title element.
  Expect.equals(0, doc.getElementsByTagName('title').length);
  var titleElement = doc.createElement("title");
  doc.body.append(titleElement);

  // For case with no children.
  Expect.equals('', doc.title);
  Expect.equals('', titleElement.text);

  // For case with single children.
  var firstText = "First";
  titleElement.append(new Text(firstText));
  Expect.equals(firstText, doc.title);
  Expect.equals(firstText, titleElement.text);

  // For case with 2 children.
  var secondText = "Second";
  titleElement.append(new Text(secondText));
  Expect.equals(firstText + secondText, doc.title);
  Expect.equals(firstText + secondText, titleElement.text);

  // override title with setting document.title with multiple title children.
  var expected = "This title is set by property";
  doc.title = expected;
  Expect.equals(expected, doc.title);
  Expect.equals(expected, titleElement.text);
}

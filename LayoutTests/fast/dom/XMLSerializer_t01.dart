/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests XmlSerializer on different node types.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  parseDocument() {
    var str = '<test><child1>First child</child1>';
    str += '<child2 attr="an attribute">Second child</child2>';
    str += '<!-- A comment --></test>';

    var parser = new DomParser();
    var doc = parser.parseFromString(str, 'text/xml');

    return doc;
  }

  var doc = parseDocument();

  var child1 = doc.documentElement.firstChild;
  var child2 = child1.nextNode;
  var comment = child2.nextNode;

  var fragment = doc.createDocumentFragment();
  fragment.append(doc.documentElement.clone(true));

  var serializer = new XmlSerializer();

  shouldBe(serializer.serializeToString(child1),
      '<child1>First child</child1>');
  shouldBe(serializer.serializeToString(child2),
      '<child2 attr="an attribute">Second child</child2>');
  shouldBe(serializer.serializeToString(comment),
      '<!-- A comment -->');
  shouldBe(serializer.serializeToString(doc),
      '<test><child1>First child</child1><child2 attr="an attribute">Second child</child2><!-- A comment --></test>');
  shouldBe(serializer.serializeToString(fragment),
      '<test><child1>First child</child1><child2 attr="an attribute">Second child</child2><!-- A comment --></test>');
}

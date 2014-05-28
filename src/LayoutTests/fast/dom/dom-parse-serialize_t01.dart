/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description DomParser/XmlSerializer test
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var parser = new DomParser();
  var str =
    '<?xml version="1.0"?>\n<!DOCTYPE doc [\n<!ATTLIST d id ID #IMPLIED>\n]>\n<doc>\n  <foo xmlns="foobar">One</foo> <x:bar xmlns:x="barfoo">Two</x:bar>\n  <d id="id3">Three</d>\n<f id="&amp;&lt;&gt;>">Four&amp;&lt;&gt;</f><empty/><empty></empty></doc>\n';
  var doc = parser.parseFromString(str,"text/xml");

  var ser = new XmlSerializer();
  shouldBe(ser.serializeToString(doc), '''
<?xml version="1.0"?><!DOCTYPE doc><doc>
  <foo xmlns="foobar">One</foo> <x:bar xmlns:x="barfoo">Two</x:bar>
  <d id="id3">Three</d>
<f id="&amp;&lt;&gt;&gt;">Four&amp;&lt;&gt;</f><empty/><empty/></doc>''');
}

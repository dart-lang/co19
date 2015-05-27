/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
      <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
      <title/>
      </head>
      <body onload="test();">
      <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=11998">bug 11998</a>:
      Incorrect serialization of quotation marks in XML attributes.</p>

      <!-- Currently, WebKit doesn't serialize the namespace unless it's explicitly specified, bug 5262 -->
      <div xmlns="http://www.w3.org/1999/xhtml" id="testDiv&#34;&#39;&#38;&#60;&#62;"/>
      </body>
      </html>
      ''', 'text/xml');

  var serialized = (new XmlSerializer())
    .serializeToString(doc.getElementById("testDiv\"'&<>"));
  shouldBeTrue(serialized == "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"testDiv&quot;'&amp;&lt;&gt;\"/>" ||
      serialized == "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"testDiv&quot;'&amp;&lt;&gt;\"></div>" ||
      serialized == "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"testDiv&quot;'&amp;&lt;>\"/>" ||
      serialized == "<div xmlns=\"http://www.w3.org/1999/xhtml\" id=\"testDiv&quot;'&amp;&lt;>\"></div>");
}

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
  var f = new DocumentFragment.html('''
      <meta http-equiv="Content-Security-Policy" content="connect-src http://invalid http://127.0.0.1">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>Test EventSource constructor functionality.</p>
      <div id="result"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

   shouldThrow(() => new EventSource(""), // empty string
      (e) => e is DomException && e.name == DomException.SYNTAX);

  shouldThrow(() => new EventSource("http://webserver:eighty/"), // invalid URL
      (e) => e is DomException && e.name == DomException.SYNTAX);

  shouldThrow(() => new EventSource("http://disallowed.example.com/"), // URL blocked by Content Security Policy
      (e) => e is DomException && e.name == DomException.SECURITY);

  var es = new EventSource("http://127.0.0.1/", withCredentials: false);
  es.close();
  shouldBeFalse(es.withCredentials);
}

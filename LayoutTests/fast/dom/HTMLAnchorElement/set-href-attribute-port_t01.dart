 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setting the port attribute of the URL in HTMLAnchorElement.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  AnchorElement a = document.createElement('a');

  debug("Default port as string");
  a.href = "https://www.mydomain.com:8080/path/testurl.html?key=value";
  a.port = "443";
  shouldBe(a.href, 'https://www.mydomain.com/path/testurl.html?key=value');

  debug("Set port to 0");
  a.href = "https://www.mydomain.com:8080/path/testurl.html?key=value";
  a.port = "0";
  shouldBe(a.href, 'https://www.mydomain.com:0/path/testurl.html?key=value');

  // Firefox 3.5.2 does not accept the port if any character is not a digit.
  debug("Set port to non-number");
  a.href = "https://www.mydomain.com:8080/path/testurl.html?key=value";
  a.port = "4a";
  shouldBe(a.href, 'https://www.mydomain.com:4/path/testurl.html?key=value');

  // Firefox 3.5.2 does not accept the port if it is null.
  //debug("Set port to null");
  //a.href = "https://www.mydomain.com:8080/path/testurl.html?key=value";
  //a.port = null;
  //shouldBe(a.href, 'https://www.mydomain.com:0/path/testurl.html?key=value');

  // Firefox 3.5.2 does not accept the port if it is null.
  debug("Set port to empty string");
  a.href = "https://www.mydomain.com:8080/path/testurl.html?key=value";
  a.port = "";
  shouldBe(a.href, 'https://www.mydomain.com:0/path/testurl.html?key=value');

  // Firefox 3.5.2 does not allow setting the port on a URL with protocol foo: .
  debug("Set port to URL with foo: protocol");
  a.href = "foo://bar/";
  a.port = "50";
  shouldBe(a.href, 'foo://bar:50/');
}


 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setting the protocol attribute of the URL in HTMLAnchorElement.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  AnchorElement a = document.createElement('a');

  debug("Basic test");
  a.href = "https://www.mydomain.com/path/";
  a.protocol = "http-foo";
  shouldBe(a.href, 'http-foo://www.mydomain.com/path/');

  // IE8 throws "Invalid argument" exception.
  debug("Set a protocol that contains ':'");
  a.href = "https://www.mydomain.com/path/";
  a.protocol = "http:foo";
  shouldBe(a.href, 'http://www.mydomain.com/path/');

  // IE8 throws "Invalid argument" exception.
  debug("Set a protocol that contains invalid characters");
  a.href = "https://www.mydomain.com/path/";
  a.protocol = "http^foo";
  shouldBe(a.href, 'https://www.mydomain.com/path/');

  // The expected behavior should change when the character table is updated.
  // IE8 encodes '^' in the host.
  debug("Set a protocol to a URL with invalid host name");
  a.href = "h:^^";
  a.protocol = "foo";
  shouldBe(a.href, 'foo:^^');

  // IE8 throws "Invalid argument" exception.
  debug("Set a protocol that starts with ':'");
  a.href = "https://www.mydomain.com/path/";
  a.protocol = ":http";
  shouldBe(a.href, 'https://www.mydomain.com/path/');

  //debug("Set protocol to null");
  //a.href = "https://www.mydomain.com/path/";
  //a.protocol = null;
  //shouldBe(a.href, 'null://www.mydomain.com/path/');

  // IE8 throws "Invalid argument" exception.
  debug("Set protocol to empty string");
  a.href = "https://www.mydomain.com/path/";
  a.protocol = "";
  shouldBe(a.href, 'https://www.mydomain.com/path/');

  // Firefox 4 adds three slashes, unlike Safari and Chrome
  debug("Set protocol to http on malformed URL");
  a.href = "foo:??bar";
  a.protocol = "http";
  shouldBe(a.href, 'http:/??bar');

  // IE8 keeps the protocol if it is 'c:'.
  debug("Set protocol to a URL which points to a local file");
  a.href = "c:\path";
  a.protocol = "f-oo";
  shouldBe(a.href, 'f-oo:path');
}

 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setting the search attribute of the URL in HTMLAnchorElement.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var a = document.createElement('a');

  debug("Set search without '?'");
  a.href = "https://www.mydomain.com/path/?key=value";
  a.search = "value=key";
  shouldBe(a.href, 'https://www.mydomain.com/path/?value=key');

  // IE8 does not encode spaces in search string
  debug("Set search that starts with '?' and contains spaces");
  a.href = "https://www.mydomain.com/path/?key=value";
  a.search = "?val ue= key?";
  shouldBe(a.href, 'https://www.mydomain.com/path/?val%20ue=%20key?');

  debug("Set search to a malformed URL");
  a.href = "s:www.mydomain.com/path/";
  a.search = "%";
  shouldBe(a.href, 's:www.mydomain.com/path/?%');

  // IE8 throws "The URL is invalid" exception.
  debug("Set search containing '#'");
  a.href = "https://www.mydomain.com/path/?key=value#hash";
  a.search = "?value#key";
  shouldBe(a.href, 'https://www.mydomain.com/path/?value%23key#hash');

  debug("Set search to a malformed URL");
  a.href = "bad:/|/url";
  a.search = "?value=key";
  shouldBe(a.href, 'bad:/|/url?value=key');

  //debug("Set search to null");
  //a.href = "https://www.mydomain.com/path/?key=value";
  //a.search = null;
  //shouldBe(a.href, 'https://www.mydomain.com/path/?null');

  // Firefox 3.5.2 Removes the '?', and it shouldn't, per
  // http://dev.w3.org/html5/spec/infrastructure.html#url-decomposition-idl-attributes .
  debug("Set search to empty string");
  a.href = "https://www.mydomain.com/path/?key=value";
  a.search = "";
  shouldBe(a.href, 'https://www.mydomain.com/path/?');
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 *
 * If start and end are provided, only the substring from start to end is parsed
 * as a URI.
 *
 * If the string is not valid as a URI or URI reference, a FormatException is
 * thrown.
 * @description Checks that components of well-formed URI match
 * appropriate regexp match groups.
 * RFC-3986 The following line is the regular expression for
 * breaking-down a well-formed URI reference into its components.
 *   ^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?
 *    12            3  4          5       6  7        8 9
 * scheme    = $2
 * authority = $4
 * path      = $5
 * query     = $7
 * fragment  = $9
 * @author ilya
 */
import "../../../Utils/expect.dart";

var r = new RegExp(r'^(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?');

main() {
  var s = 'scheme://user:pass@foo.bar-baz:123/A/V/file-name.ext?query#fragment';
  var uri = Uri.parse(s);
  var match = r.firstMatch(s);
  Expect.equals(match[2], uri.scheme);
  Expect.equals(match[4], uri.authority);
  Expect.equals(match[5], uri.path);
  Expect.equals(match[7], uri.query);
  Expect.equals(match[9], uri.fragment);
}

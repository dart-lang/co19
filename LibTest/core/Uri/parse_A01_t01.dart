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
 * @description Checks that following valid URI scheme is accepted:
 * RFC-3986 scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('foo', Uri.parse('foo:bar').scheme);
  Expect.equals('foo+bar-baz123', Uri.parse('foo+bar-baz123:foo').scheme);
  Expect.equals('foo+bar-baz.123', Uri.parse('foo+bar-baz.123://').scheme);
}

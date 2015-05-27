/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri)
 * Creates a new URI object by parsing a URI string.
 * @description Checks that following valid URI scheme is accepted:
 * RFC-3986 scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  Expect.equals('foo', Uri.parse('foo:bar').scheme);
  Expect.equals('foo+bar-baz123', Uri.parse('foo+bar-baz123:foo').scheme);
  Expect.equals('foo+bar-baz.123', Uri.parse('foo+bar-baz.123://').scheme);
}
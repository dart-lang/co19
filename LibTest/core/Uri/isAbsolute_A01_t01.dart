/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isAbsolute
 * Returns whether the URI is absolute.
 * A URI is an absolute URI in the sense of RFC 3986 if it has a scheme and no
 * fragment.
 * @description Checks expected isAbsolute values
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(Uri.parse('foo:').isAbsolute);
  Expect.isTrue(Uri.parse('foo:bar').isAbsolute);
  Expect.isTrue(Uri.parse('a://').isAbsolute);
  Expect.isTrue(Uri.parse('a://b/c').isAbsolute);
  Expect.isFalse(Uri.parse('a://b/c#d').isAbsolute);
  Expect.isFalse(Uri.parse('//a/b/c').isAbsolute);
  Expect.isFalse(Uri.parse('/a/b/c').isAbsolute);
  Expect.isFalse(Uri.parse('./a/b/c').isAbsolute);
  Expect.isFalse(Uri.parse('../a/b/c').isAbsolute);
  Expect.isFalse(Uri.parse('a/b/c').isAbsolute);
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolveUri(Uri reference)
 * Resolve reference as an URI relative to this.
 * ...
 * Updated to handle the case where the base URI is just a relative path - that
 * is: when it has no scheme or authority and the path does not start with a
 * slash. In that case, the paths are combined without removing leading "..",
 * and an empty path is not converted to "/".
 *
 * @description Checks that when it has no scheme or authority and the path does
 * not start with a slash. In that case, the paths are combined without removing
 * leading "..", and an empty path is not converted to "/"
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.2)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('a/b/c');
  Expect.equals(Uri.parse('a/z'), x.resolveUri(new Uri(path: '../z')));
  Expect.equals(Uri.parse('a/b/c'), x.resolveUri(new Uri(path: '')));

  x = Uri.parse('a/b/c/');
  Expect.equals(Uri.parse('a/b/c/'), x.resolveUri(new Uri(path: '')));
}

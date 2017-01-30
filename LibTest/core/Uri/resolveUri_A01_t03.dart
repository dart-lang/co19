/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolveUri(Uri reference)
 * Resolve reference as an URI relative to this.
 *
 * Returns the resolved URI.
 *
 * The algorithm "Transform Reference" for resolving a reference is described in
 * RFC-3986 Section 5.
 *
 * Updated to handle the case where the base URI is just a relative path - that
 * is: when it has no scheme or authority and the path does not start with a
 * slash. In that case, the paths are combined without removing leading "..",
 * and an empty path is not converted to "/".
 * @description Checks that this method works correctly if schema is specified
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.2)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host/a/b?x=1#frag');
  Expect.equals(Uri.parse('https:'), x.resolveUri(new Uri(scheme: 'https')));
  Expect.equals(Uri.parse('https://l:p@h/p'),
      x.resolveUri(new Uri(scheme: 'https', userInfo: 'l:p', host: 'h',
          path: 'p')));
  Expect.equals(Uri.parse('https://l:p@h/p?q'),
      x.resolveUri(new Uri(scheme: 'https', userInfo: 'l:p', host: 'h',
          path: 'p', query: 'q')));
  Expect.equals(Uri.parse('https://l:p@h/p?q#f'),
      x.resolveUri(new Uri(scheme: 'https', userInfo: 'l:p', host: 'h',
          path: 'p', query: 'q', fragment: 'f')));
}

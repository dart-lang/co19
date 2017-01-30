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
 * @description Checks that this method works correctly if schema is not
 * provided but authority is provided. Test that dot parts are removed in this
 * case (see https://tools.ietf.org/html/rfc3986#section-5.2.4)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host:8080/a/b/c/d?x=1#fr');
  Expect.equals(Uri.parse('http://l:p@hst:8081/z?q'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', port: 8081,
          path: '/../z', query: 'q')));
  Expect.equals(Uri.parse('http://l:p@hst:8081/z?q'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', port: 8081,
          path: '/../../../../z', query: 'q')));
  Expect.equals(Uri.parse('http://l:p@hst/'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', path: '/.')));
  Expect.equals(Uri.parse('http://l:p@hst/a/'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', path: '/./a/')));
  Expect.equals(Uri.parse('http://l:p@hst/'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', path: '/..')));
  Expect.equals(Uri.parse('http://l:p@hst/'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', path: '/../..')));
  Expect.equals(Uri.parse('http://l:p@hst/z?q'),
      x.resolveUri(new Uri(userInfo: 'l:p', host: 'hst', path: '/.././z',
          query: 'q')));
}

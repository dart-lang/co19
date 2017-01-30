/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolve(String reference)
 * Resolve reference as an URI relative to this.
 * @description Checks that this method works correctly if schema, authority
 * and path are not provided
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.2)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host:8080/a/b?x=1#frag');
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b?x=1'), x.resolve(''));
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b?x=1#f'),
      x.resolve('#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b?q=0#f'),
      x.resolve('?q=0#f'));
}

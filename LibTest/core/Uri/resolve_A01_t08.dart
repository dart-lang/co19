/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolve(String reference)
 * Resolve reference as an URI relative to this.
 * @description Checks that this method works correctly if schema and authority
 * are not provided but path is provided
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.2)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host:8080/a/b/c?x=1#frag');
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b/z'), x.resolve('z'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b/z#f'),
      x.resolve('z#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/b/z?q=0#f'),
      x.resolve('z?q=0#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/a/x?q=0#f'),
      x.resolve('z/../../x?q=0#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/z?q=0#f'),
      x.resolve('/z?q=0#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/x?q=0#f'),
      x.resolve('/z/../../x?q=0#f'));
  Expect.equals(Uri.parse('http://login:pass@host:8080/z/x?q=0#f'),
      x.resolve('/z/././x?q=0#f'));

  x = Uri.parse('a/b/c');
  Expect.equals(Uri.parse('a/z#f'), x.resolve('../z#f'));
}

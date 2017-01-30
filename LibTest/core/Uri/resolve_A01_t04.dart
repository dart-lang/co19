/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolve(String reference)
 * Resolve reference as an URI relative to this.
 * @description Checks that this method works correctly if schema is specified.
 * Test that dot parts are removed in this case
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.4)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host/a/b/c/d?x=1#fr');
  Expect.equals(Uri.parse('http://login:pass@host/z?q'),
      x.resolve('http://login:pass@host/../z?q'));
  Expect.equals(Uri.parse('http://login:pass@host/z?q'),
      x.resolve('http://login:pass@host/../../../../../z?q'));
  Expect.equals(Uri.parse('http://login:pass@host/'),
      x.resolve('http://login:pass@host/.'));
  Expect.equals(Uri.parse('http://login:pass@host/a/'),
      x.resolve('http://login:pass@host/./a/'));
  Expect.equals(Uri.parse('http://login:pass@host/'),
      x.resolve('http://login:pass@host/..'));
  Expect.equals(Uri.parse('http://login:pass@host/'),
      x.resolve('http://login:pass@host/../..'));
  Expect.equals(Uri.parse('https://l:p@h/z?q'),
      x.resolve('https://l:p@h/.././z?q'));
}

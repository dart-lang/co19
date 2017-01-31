/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolve(String reference)
 * Resolve reference as an URI relative to this.
 * @description Checks that this method works correctly for an empty string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host/a/b?x=1#frag');
  Expect.equals(Uri.parse('http://login:pass@host/a/b?x=1'), x.resolve(''));

  x = Uri.parse('http://host');
  Expect.equals(Uri.parse('http://host'), x.resolve(''));

  x = Uri.parse('http://host/');
  Expect.equals(Uri.parse('http://host/'), x.resolve(''));

  x = Uri.parse('');
  Expect.equals(Uri.parse(''), x.resolve(''));

  x = Uri.parse('z');
  Expect.equals(Uri.parse('z'), x.resolve(''));
}

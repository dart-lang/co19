/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolve(String reference)
 * Resolve reference as an URI relative to this.
 * @description Checks that this method works correctly if schema is specified
 * (see https://tools.ietf.org/html/rfc3986#section-5.2.2)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://login:pass@host/a/b?x=1#frag');
  Expect.equals(Uri.parse('https://'), x.resolve('https://'));
  Expect.equals(Uri.parse('https://l:p@h/p'), x.resolve('https://l:p@h/p'));
  Expect.equals(Uri.parse('https://l:p@h/p?q'), x.resolve('https://l:p@h/p?q'));
  Expect.equals(Uri.parse('https://l:p@h/p?q'), x.resolve('HTTPS://l:p@H/p?q'));
  Expect.equals(Uri.parse('https://l:p@h/p?q#f'),
      x.resolve('HTTPS://l:p@H/p?q#f'));
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri resolveUri(Uri reference)
 * Resolve reference as an URI relative to this.
 * @description Checks expected resolved URIs
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = Uri.parse('http://host/a/b?x=1#frag');
  Expect.equals(Uri.parse('http://host/a/c'), x.resolveUri(Uri.parse('c')));
  Expect.equals(Uri.parse('http://host/a/c'), x.resolveUri(Uri.parse('./c')));
  Expect.equals(Uri.parse('http://host/c'), x.resolveUri(Uri.parse('/c')));
  Expect.equals(Uri.parse('http://host/c'), x.resolveUri(Uri.parse('../c')));
}

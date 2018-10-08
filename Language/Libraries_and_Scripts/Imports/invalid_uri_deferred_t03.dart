/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the specified URI of a deferred import
 * does not refer to a library declaration.
 * @description Checks that it is not a static type warning if the file pointed
 * to by a deferred import directive exists but does not contain a library
 * declaration.
 * @author ngl@unipro.ru
 */
import "invalid_uri_t03_lib.dart" deferred as p;

main() {
  try {
    p.foo();
  } on NoSuchMethodError { }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a URI x where the declaration of an imported
 * library is to be found. It is a compile-time error if the speciﬁed URI does
 * not refer to a library declaration.
 * @description Checks that it is not a compile-time error if the file pointed
 * to by an import directive exists but does not contain a library declaration.
 * @author rodionov
 * @reviewer kaigorodov
 */

import "invalid_uri_t03_lib.dart";

main() {
  try {
    foo();
  } catch (e) {}
}

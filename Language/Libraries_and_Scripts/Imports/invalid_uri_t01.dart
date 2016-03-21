/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a URI x where the declaration of an imported
 * library is to be found. It is a compile-time error if the speciﬁed URI does
 * not refer to a library declaration.
 * @description Checks that it is a compile-time error if the URI in an import
 * directive refers to a part declaration which is not a library declaration.
 * @compile-error
 * @author ilya
 */

library my_lib;

import "invalid_uri_t01_part.dart";

main() {
  try {
    var someVar = 0;
  } catch (e) {}
}

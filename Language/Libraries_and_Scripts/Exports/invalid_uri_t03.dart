/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the specified URI does not refer
 * to a library declaration.
 * @description Checks that it is a compile-time error when the resource
 * specified by the URI refers to a part declaration which is not a library
 * declaration
 * @compile-error
 * @author ilya
 */

library my_lib;

export "invalid_uri_t03_part.dart";

main() {
}

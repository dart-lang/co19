/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is re-exported by a library
 * L and N is introduced into the export namespace of L by more than one export.
 * @description Checks that it is a compile-time error if this library imports
 * another which re-exports two more libraries defining the same name but that
 * name is not referenced in this library.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 6134
 */

import "reexport_lib.dart";

main() {
  libVar++;
}

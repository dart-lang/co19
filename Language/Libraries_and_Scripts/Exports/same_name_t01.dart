// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is not an error or warning to export two different libraries
/// with the same name
/// @description Checks it is not a compile error if there are two export
/// directives referring to different uris with the same library name.
/// @author ilya

import "../../../Utils/expect.dart";
import "same_name_t01_lib1.dart";
import "same_name_t01_lib2.dart";

export "same_name_t01_lib1.dart"; //library the_same_name;
export "same_name_t01_lib2.dart"; //library the_same_name;

main() {
  Expect.equals(1, foo);
  Expect.equals(1, bar);
}

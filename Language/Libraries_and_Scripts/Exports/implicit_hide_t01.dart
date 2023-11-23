// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a name N is referenced by a library L and N would be
/// introduced into the exported namespace of L by exports of two libraries, L1
/// and L2, and the exported namespace of L1 binds N to a declaration
/// originating in a system library:
/// • The export of L1 is implicitly extended by a hide N clause.
/// @description Checks implicit hiding of SDK library classes
/// @author ilya

import "../../../Utils/expect.dart";
import 'implicit_hide_t01_lib1.dart';

main() {
  Expect.equals('MYLIST', List.typename);
  Expect.equals('MYLIST2', List2.typename);
}


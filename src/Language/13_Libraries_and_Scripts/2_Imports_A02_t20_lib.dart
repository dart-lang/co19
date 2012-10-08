// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Imports_A02_t20_lib;

import "2_Imports_A02_lib.dart" as P;
export "2_Imports_A02_lib.dart";

// redefine a couple declarations from the re-exported library
class aFoo {}
var aFunc = 42;

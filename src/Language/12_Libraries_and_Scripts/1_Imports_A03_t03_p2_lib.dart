// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library("1_Imports_A03_t03_p2_lib");

class foo { } // error - variable is already defined in 1_Imports_A03_t03_p1_lib.dart
bar(int x, bool b) { return 0; } // error - variable is already defined in 1_Imports_A03_t03_p1_lib.dart

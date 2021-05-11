// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a run time error if S does not declare or export either:
/// • A top-level function named main, or
/// • A top-level getter named main that returns a function.
/// @description Checks that main() can be placed in a part unit.
/// @author ilya


library main_in_a_part;

part 'library5.dart';

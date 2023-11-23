// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that unmigrated library cannot re-export migrated one in
/// the strong mode.
/// Please note that this test should not be executed with analyzer.
/// Dart throws a compile error here whereas analyzer just prints a hint, such a
/// behavior is expected.
/// @Issue 44545
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "../../weak/exports_A01_opted_out_lib.dart";

main() {}

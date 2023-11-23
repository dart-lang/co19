// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  All opted-in libraries upstream from the legacy library are
/// viewed by the legacy library with nullability related features erased from
/// their APIs. In particular:
///  - All types of the form T? in the opted-in API are treated as T.
///  - All required named parameters are treated as optional named parameters.
///  - The type Never is treated as the type Null
///
/// @description Checks that legacy code cannot run in the strong mode/
/// @Issue 44545
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

// @dart=2.6
// ^^^^^^^^^
// [cfe] unspecified

main() {}


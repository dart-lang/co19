// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for `scope*` tests. Partially exports
/// `scope_lib1.dart` and `scope_lib2.dart`.
///
/// @description Common library for `scope*` tests.Partially exports
/// `scope_lib1.dart` and `scope_lib2.dart`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import 'scope_lib1.dart' show LibClass;
import 'scope_lib2.dart' hide lib2Func;
export 'scope_lib1.dart';
export 'scope_lib2.dart';

String lib4Func() => "scope_lib4 lib4Func";

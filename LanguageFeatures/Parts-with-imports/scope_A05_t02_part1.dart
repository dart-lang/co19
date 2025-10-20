// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `P`, the combined import scope of `F`, be a scope with `I` as
/// enclosing scope and a namespace containing every import prefix declared by
/// an import declaration of `F`.
/// ...
/// - If an import is `deferred`, its `Pname` is a deferred scope which has an
///   extra `loadLibrary` member added, and the import implicitly hides any
///   member named loadLibrary in the (singular) imported library's export scope
///   (as usual).
///
/// @description Check that if an import is deferred an extra `loadLibrary`
/// member is added and it can be a runtime error to access any of its members
/// before `loadLibrary()` completes successfully. Test the case when
/// `loadLibrary()` is called from another part file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A05_t02.dart';

import 'scope_lib1.dart' deferred as l1 hide LibExt;

part 'scope_A05_t02_part2.dart';

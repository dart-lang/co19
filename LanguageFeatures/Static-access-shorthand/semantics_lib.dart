// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Helper library for static access shorthand semantics tests.
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'shorthand_lib.dart';

C<T> testClass<T>(C<T> c) => c;
M<T> testMixin<T>(M<T> m) => m;
E<T> testEnum<T>(E<T> e) => e;
ET<T> testExtensionType<T>(ET<T> et) => et;

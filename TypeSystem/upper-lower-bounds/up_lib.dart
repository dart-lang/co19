// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Auxiliary library for `UP` tests.
/// @author sgrekhov22@gmail.com

import 'dart:async';

void getVoid() {}
FutureOr<void> getFutureOrVoid() {}

class C {}

class D<T0, T1> {}

enum E { e0 }

extension type ET(int _) {}

typedef FPositional = int Function<X extends num>(X s, [int i]);
typedef FNamed = int Function<X extends num>(X s, {int i});
typedef Rec = (int, String, {bool b});

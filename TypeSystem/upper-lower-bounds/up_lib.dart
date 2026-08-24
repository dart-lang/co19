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
enum E2 { e0 }

extension type ET(int _) {}
extension type ET2(ET _) implements ET {}

typedef FPositional = num Function<X extends num>(X x, [int i]);
typedef FPositional2 = int Function<X extends num>(X x, [num i]);
typedef FNamed = num Function<X extends num>(X x, {int i});
typedef FNamed2 = int Function<X extends num>(X x, {num i});
typedef Rec = (num, Pattern, {bool b});
typedef Rec2 = (int, String, {bool b});

num fPositional<X extends num>(X x, [int i = 0]) => x + i;
int fPositional2<X extends num>(X x, [num i = 0]) => (x + i).toInt();
num fNamed<X extends num>(X x, {int i = 0}) => x + i;
int fNamed2<X extends num>(X x, {num i = 0}) => (x + i).toInt();

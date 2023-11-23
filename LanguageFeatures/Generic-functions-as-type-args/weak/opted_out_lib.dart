// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @author iarkh@unipro.ru

library opted_out_lib;

class C1<X extends void Function<T>()> {}
class C2<X extends T Function<T>()> {}
class C3<X extends void Function<T>(T)> {}
class C4<X extends void Function<T>()> {}

class D<T> {}
typedef A1 = D<void Function<T>()>;
typedef A2 = D<T Function<T>()>;
typedef A3 = D<void Function<T>(T)>;
typedef A4 = D<T Function<T>(T)>;

typedef A5<X extends void Function<T>()> = D<X>;
typedef A6<X extends T Function<T>()> = D<X>;
typedef A7<X extends void Function<T>(T)> = D<X>;
typedef A8<X extends T Function<T>(T)> = D<X>;

typedef F1 = void Function<X extends void Function<T>()>();
typedef F2 = X Function<X extends T Function<T>()>();
typedef F3 = void Function<X extends void Function<T>(T)>(X);
typedef F4 = void Function<X extends T Function<T>(T)>(X);

typedef F5<X extends void Function<T>()> = void Function();
typedef F6<X extends T Function<T>()> = void Function();
typedef F7<X extends void Function<T>(T)> = void Function();
typedef F8<X extends T Function<T>(T)> = void Function();

typedef void F9<X extends void Function<T>()>();
typedef void F10<X extends void Function<T>(T)>();
typedef void F11<X extends T Function<T>()>();
typedef void F12<X extends T Function<T>(T)>();

void F13<X extends void Function<T>()>() {}
void F14<X extends void Function<T>(T)>() {}
void F15<X extends T Function<T>()>() {}
void F16<X extends T Function<T>(T)>() {}

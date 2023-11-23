// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library Libraries_and_Scripts_A01_t21_lib;

class A {}
class B extends A {}
class C<T> {}

typedef AAlias = A;
typedef BAlias = B;
typedef CAlias1<T> = C<T>;
typedef CAlias2<T extends num> = C<T>;


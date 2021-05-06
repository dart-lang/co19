// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


@Deprecated('before_lib2_p01') @A<int>(42)
part of before_lib2;

int i = 0;

class A<T> {
  const A(T t);
}

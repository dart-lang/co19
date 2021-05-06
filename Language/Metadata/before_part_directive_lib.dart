// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


library before_part_directive_lib;
@Deprecated("") @X<int>(42)
part "before_part_directive_lib_part.dart";

class X<T> {
  const X(T t);
}

// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar of types is extended to allow any type to be suffixed
/// with a ? (e.g. int?) indicating the nullable version of that type.
///
/// @description Check that any type can be suffixed with a ? indicating the
/// nullable version of that type. Test Never
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
Never? foo(Never? n) => n;

main() {
  Never? n = null;
  n = foo(n);
}

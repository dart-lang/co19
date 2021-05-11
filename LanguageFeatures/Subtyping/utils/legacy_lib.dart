// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @author sgrekhov@unipro.ru

// @dart=2.6
library legacy_lib;

class X {
  const X();
}

class Y extends X {
  const Y();
}

T getLegacyType<T>(T t) => t;

/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
library opted_out_lib;

X getLegacyType<X>(X x) => x;

typedef LegacyInt = int;

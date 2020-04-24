/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
library opted_in_lib;
import 'dart:async';

class A<X> {}
class B<X> implements A<X?> {}
class B2<X> implements A<X> {}

class FO<X> extends B2<FutureOr<X>> {}

class G<X> {}


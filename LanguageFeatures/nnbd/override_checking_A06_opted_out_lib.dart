/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
// @dart=2.6

import "dart:async";

class A<T> {}

class out_int      implements A<int     > {}
class out_Function implements A<Function> {}
class out_Object   implements A<Object  > {}

class out_dynamic implements A<dynamic> {}
class out_void    implements A<void   > {}
class out_Null    implements A<Null   > {}

class out_FutureOr          implements A<FutureOr>           {}
class out_FutureOr_int      implements A<FutureOr<int>>      {}
class out_FutureOr_FutureOr implements A<FutureOr<FutureOr>> {}

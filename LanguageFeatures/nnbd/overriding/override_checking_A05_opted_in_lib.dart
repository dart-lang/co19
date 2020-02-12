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

import "dart:async";

class A<T> {}

class in_nullable_int      implements A<int?     > {}
class in_nullable_Function implements A<Function?> {}
class in_Nullable_Object   implements A<Object?  > {}

class in_int      implements A<int     > {}
class in_Function implements A<Function> {}
class in_Object   implements A<Object  > {}

class in_dynamic implements A<dynamic> {}
class in_void    implements A<void   > {}
class in_Null    implements A<Null   > {}

class in_Never implements A<Never> {}

class in_FutureOr          implements A<FutureOr>           {}
class in_FutureOr_int      implements A<FutureOr<int>>      {}
class in_FutureOr_FutureOr implements A<FutureOr<FutureOr>> {}

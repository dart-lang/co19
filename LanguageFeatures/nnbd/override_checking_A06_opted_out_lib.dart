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

class A<T> { Type getType() => T; }

class out_int      extends A<int     > {}
class out_Function extends A<Function> {}
class out_Object   extends A<Object  > {}

class out_dynamic extends A<dynamic> {}
class out_void    extends A<void   > {}
class out_Null    extends A<Null   > {}

class out_FutureOr          extends A<FutureOr>           {}
class out_FutureOr_int      extends A<FutureOr<int>>      {}
class out_FutureOr_FutureOr extends A<FutureOr<FutureOr>> {}

class out_Never extends A<Never> {}


class out_int1      extends A<int     > {}
class out_Function1 extends A<Function> {}
class out_Object1   extends A<Object  > {}

class out_dynamic1 extends A<dynamic> {}
class out_void1    extends A<void   > {}
class out_Null1    extends A<Null   > {}

class out_FutureOr1          extends A<FutureOr>           {}
class out_FutureOr_int1      extends A<FutureOr<int>>      {}
class out_FutureOr_FutureOr1 extends A<FutureOr<FutureOr>> {}

class out_Never1 extends A<Never> {}

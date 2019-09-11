 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default function type alias parameter is treated as
 * [Object?] dynamically.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";

typedef T Function1<T>();
typedef void Function2<T>(T);
typedef T Function3<T>(T);
typedef T1 Function4<T1, T2, T3>(T2, T3);
typedef void Function5<T>();

void main() {
  Expect.equals(
      typeOf<Function1<Object?>>(),
      typeOf<Function1>()
  );

  Expect.equals(
      typeOf<Function2<Object?>>(),
      typeOf<Function2>()
  );

  Expect.equals(
      typeOf<Function3<Object?>>(),
      typeOf<Function3>()
  );

  Expect.equals(
      typeOf<Function4<Object?, Object?, Object?>>(),
      typeOf<Function4>()
  );
  Expect.equals(
      typeOf<Function5<Object?>>(),
      typeOf<Function5>()
  );

}

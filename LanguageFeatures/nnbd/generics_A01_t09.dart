 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default type parameter of the generic function type
 * alias is treated as [Object?] statically. Typedef is in the form:
 *    [typedef <type> <identifier> <formalParameterPart>].
 *
 * @Issue 40367, 40368
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
 // Requirements=nnbd-strong

import "../../Utils/expect.dart";

typedef T    Function1<T>( );
typedef void Function2<T>(T);
typedef T    Function3<T>(T);
typedef void Function4<T>( );

typedef T1 Function5<T1, T2, T3>(T2, T3);

F<Function1<Object?>>? test1(Function1 source) {
  var fsource = toF(source);
  return fsource;
}

F<Function2<Object?>>? test2(Function2 source) {
  var fsource = toF(source);
  return fsource;
}

F<Function3<Object?>>? test3(Function3 source) {
  var fsource = toF(source);
  return fsource;
}

F<Function4<dynamic>>? test4(Function4 source) {
  var fsource = toF(source);
  return fsource;
}

 F<Function5<Object?, Object?, Object?>>? test5(Function5 source) {
   var fsource = toF(source);
   return fsource;
 }

void main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
}

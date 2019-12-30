/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The modifier late is added as a built-in identifier. The grammar
 * of top level variables, static fields, instance fields, and local variables
 * is extended to allow any declaration to include the modifier late.
 *
 * @description Check that declaration of any top level variables, static
 * fields, instance fields, and local variables cab be extended by 'late'
 * modifier
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {
  static final instance = new C();
}

class C {
  static late String staticVar1 = "staticVar1";
  static late final staticVar2 = "staticVar2";
  static late var staticVar3 = "staticVar3";

  late String instanceVar1 = "instanceVar1";
  late final instanceVar2 = "instanceVar2";
  late var instanceVar3 = "instanceVar3";

  covariant late C instanceVar4 = A.instance;
  covariant late var instanceVar5 = A.instance;
}

late String globalVar1 = "globalVar1";
late final globalVar2 = "globalVar2";
late var globalVar3 = "globalVar3";

main() {
  late String localVar1 = "localVar1";
  late final localVar2 = "localVar2";
  late var localVar3 = "localVar3";

  Expect.equals("staticVar1", C.staticVar1);
  Expect.equals("staticVar2", C.staticVar2);
  Expect.equals("staticVar3", C.staticVar3);
  Expect.equals("instanceVar1", A.instance.instanceVar1);
  Expect.equals("instanceVar2", A.instance.instanceVar2);
  Expect.equals("instanceVar3", A.instance.instanceVar3);
  Expect.equals(A.instance, A.instance.instanceVar4);
  Expect.equals(A.instance, A.instance.instanceVar5);
  Expect.equals("localVar1", localVar1);
  Expect.equals("localVar2", localVar2);
  Expect.equals("localVar3", localVar3);
}

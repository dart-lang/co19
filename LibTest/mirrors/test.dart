import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

void f(@A() int a, int i1) {}

main() {
  ParameterMirror paramMirror =
      (reflectType(f.runtimeType) as FunctionTypeMirror).parameters[0];
  print(paramMirror.metadata[0].toString());
}

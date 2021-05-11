// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Object: if T1 is Object then:
///  - if T0 is an unpromoted type variable with bound B then T0 <: T1 iff
///      B <: Object
///  - if T0 is a promoted type variable X & S then T0 <: T1 iff S <: Object
///  - if T0 is FutureOr<S> for some S, then T0 <: T1 iff S <: Object.
///  - if T0 is S* for any S, then T0 <: T1 iff S <: T1
///  - if T0 is Null, dynamic, void, or S? for any S, then the subtyping does not
///      hold (per above, the result of the subtyping query is false).
///  - Otherwise T0 <: T1 is true.
/// @description Check that if T0 is an unpromoted type variable with bound B
/// but B is not subtype of Object then T0 is not subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test mixin members. Super method required
/// argument is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from right_object_fail_A01.dart and 
/// arguments_binding_mixin_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



class B {}
class T0 extends B {}

T0? t0Instance = new T0();
Object t1Instance = new Object();

const t1Default = const Object();





class ArgumentsBindingSuper1_t03 {
  void superTest(Object val) {}
  void superTestPositioned(Object val, [Object val2 = t1Default]) {}
  void superTestNamed(Object val, {Object val2 = t1Default}) {}
  Object get superGetter => t0Instance;
  void set superSetter(Object val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

  test() {
    superTest(t0Instance);

    this.superTest(t0Instance);

    super.superTest(t0Instance);

    superTestPositioned(t0Instance);

    this.superTestPositioned(t0Instance);

    super.superTestPositioned(t0Instance);

    superTestPositioned(t1Instance, t0Instance);

    this.superTestPositioned(t1Instance, t0Instance);

    super.superTestPositioned(t1Instance, t0Instance);

    superTestNamed(t0Instance);

    this.superTestNamed(t0Instance);

    super.superTestNamed(t0Instance);

    superTestNamed(t1Instance, val2: t0Instance);

    this.superTestNamed(t1Instance, val2: t0Instance);

    super.superTestNamed(t1Instance, val2: t0Instance);

    superSetter = t0Instance;

    this.superSetter = t0Instance;

    super.superSetter = t0Instance;
  }
}



test<T extends B?>(T t0Instance) {
  
  new ArgumentsBinding1_t03().superTest(t0Instance);
  new ArgumentsBinding1_t03().superTestPositioned(t0Instance);
  new ArgumentsBinding1_t03().superTestPositioned(t1Instance, t0Instance);
  new ArgumentsBinding1_t03().superTestNamed(t0Instance);
  new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: t0Instance);
  new ArgumentsBinding1_t03().superSetter = t0Instance;
  new ArgumentsBinding1_t03().test();

}

main() {
  test<T0?>(t0Instance);
}

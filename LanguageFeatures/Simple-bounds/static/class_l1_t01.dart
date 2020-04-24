/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that simple bounds are correct for the very simple case:
 *  [A<X extends num>]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../../Utils/expect.dart";

class A<X extends num> {}

main() {
  A? source;
  var fsource = toF(source);

  F<A<num>?>? target = fsource;

  F<A<int>?>? target1 = fsource;
//                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<dynamic>?>? target2 = fsource;
//                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<Never>?>? target3 = fsource;
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<Object>?>? target4 = fsource;
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A();
}

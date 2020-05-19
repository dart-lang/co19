/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The requirement that satisfaction of the bounds on the formal type
 * parameters of a generic type alias [D] must imply satisfaction of all bounds
 * pertaining to every type that occurs in the body of [D] limits the expressive
 * power of generic type aliases. However, it would require the constraints on
 * formal type parameters to be expressed in a much more powerful language if we
 * were to allow a significantly larger set of types to be expressed using a
 * generic type alias.
 * For example, consider the following code:
 *     class A<X extends void Function(num)> {}
 *     typedef F<Y> = A<void Function(Y)> Function(); // compile-time error
 * There is no way to specify a bound on [Y] in the declaration of [F] which
 * will ensure that all bounds on the right hand side are respected. This is
 * because the actual requirement is that [Y] must be a supertype of [num], but
 * Dart does not support lower bounds for type parameters. The type [A<void
 * Function(U)> Function()] can still be specified explicitly for every [U]
 * which satisfies the bounds declared by [A]. So the types can be expressed,
 * they just cannot be abbreviated using a generic type alias.
 * @description Checks that example from the Spec throws compile error as
 * expected.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A<X extends void Function(num)> {}
typedef AAlias<Y> = A<Y>;

main() {
}

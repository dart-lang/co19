// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This new syntax also introduces new ambiguities in the grammar,
/// similar to the one we introduced with generic functions. Examples include:
///
/// f(a<b,c>(d)); // Existing ambiguity, resolved to a generic method call.
/// f(x.a<b,c>[d]); // f((x.a<b, c>)[d]) or f((x.a < b), (c > [d]))
/// f(x.a<b,c>-d);  // f((x.a<b, c>)-d) or f((x.a < b), (c > -d]))
/// The x.a<b,c> can be an explicitly instantiated generic function tear-off or
/// an explicitly instantiated type literal named using a prefix, which is new.
/// While neither type objects nor functions declare operator- or operator[],
/// such could be added using extension methods.
///
/// We will disambiguate such situations heuristically based on the token
/// following the > that matches the < we are ambiguous about. In the existing
/// ambiguity we treat ( as a sign that the < starts a generic invocation. We
/// extend the number of tokens which, when following a potential type argument
/// list, makes us choose to parse the previous tokens as that type argument
/// list.
///
/// There is a number of tokens which very consistently end an expression, and
/// we include all those:
///
/// ), }, ], ;, :, ,
///
/// Then we include tokens which we predict will continue a generic instantiation:
///
/// ( . == !=
///
/// The first six are tokens which cannot possibly start an expression, and
/// therefore cannot occur after a greater-than infix operator. The last four
/// tokens can continue an expression, and of those only ( can also start an
/// expression, and we already decided how to disambiguate that).
///
/// There are many other tokens which currently cannot continue an expression
/// (and therefore cannot validly follow a type argument list) or which cannot
/// start an expression (and therefore cannot validly follow a greater-than
/// operator), but in the service of keeping our future options open, we choose
/// a design that does not rely on those restrictions. For example we omit most
/// infix operators from being "continuation tokens", even though they currently
/// cannot start a new expression, and therefore cannot follow a > infix
/// operator. This leaves us open to allowing some of those operators as prefix
/// operators in the future, like we currently allow the - operator.
///
/// @description Checks that any other token following the ambiguous > will make
/// the prior tokens be parsed as comma separated < and > operator invocations.
/// Test '{' token
/// @author sgrekhov@unipro.ru

String f(a, [b]) => "$a, $b";

String a<T1, T2>(int x) {
  return "a<$T1, $T2>($x)";
}

typedef b = int;
typedef c = String;

extension on Function {
  bool operator< (Type t) => true;
}

extension on Type {
  int operator> (int i) => i;
}

main() {
  f(a<b,
      c> {});
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

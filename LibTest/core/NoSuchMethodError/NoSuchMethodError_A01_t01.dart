// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Undocumented
/// @description Checks that this constructor executes without error for various
/// sets of arguments (including null).
/// @author rodionov

Symbol sym([String s = '']) => new Symbol(s);

main() {
  new NoSuchMethodError.withInvocation(
      null, Invocation.method(sym(), null, null));
  new NoSuchMethodError.withInvocation(null, Invocation.method(sym(), [], {}));
  new NoSuchMethodError.withInvocation(
      null, Invocation.method(sym(), [null], {sym("a"): null}));
  new NoSuchMethodError.withInvocation(
      null, Invocation.method(sym("foo"), [1, 2], {sym("foo"): "bar"}));
  new NoSuchMethodError.withInvocation(
      "foo", Invocation.method(sym(), [1, 2], {sym("foo"): "bar"}));
  new NoSuchMethodError.withInvocation(
      "foo", Invocation.method(sym("foo"), [], {}));
  String foo = "foo";
  new NoSuchMethodError.withInvocation(
      foo, Invocation.method(sym(foo), [foo], {sym(): foo}));
}

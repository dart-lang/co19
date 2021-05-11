// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Metadata can appear before  ...  parameter ...
/// @description Check that metadata is allowed before typedef declaration
/// parameter
/// @author a.semenov@unipro.ru

import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

typedef void f(@A() int, String);

main() {
  // This is a case where the documentation of `reflectType` isn't sufficiently
  // detailed to preclude any behavior. Initially the test seems to have been
  // written under the assumption that we would always get a `TypedefMirror`
  // when call `reflectType(f)`, and that's probably also how it used to work.
  //
  // Today, implementations will often expand type aliases at compile-time
  // (which  is always possible, now that we have the inline syntax
  // `R Function(...)` for function types). That is probably a worthwhile
  // optimization, because we don't have to look up the meaning of that typedef
  // each time it is needed at run time. In any case, it does happen (for
  // instance: right here), and we can't say that it is wrong, so we need to
  // deal with it.
  //
  // So here we preserve the support for the old behavior and add support for
  // the current behavior, i.e. assume that it can be either `TypedMirror` or
  // `TypedefMirror` here.
  ParameterMirror paramMirror =
    reflectType(f) is TypedefMirror ?
      (reflectType(f) as TypedefMirror).referent.parameters[0] :
        (reflectType(f) as FunctionTypeMirror).parameters[0];

  // Cf. https://github.com/dart-lang/language/issues/656, the language team
  // decided that we would not support metadata on type parameters of a function
  // type. Nothing was said about parameters that are not type parameters (that
  // is, "normal" parameters like `x` and `y` in `X Function<X>(X x, int y)`),
  // and nothing was said about whether the response from tools should be to
  // emit a compile-time error. It would make sense to simply skip unsupported
  // metadata silently, because it could then be allowed to exist in source
  // code, and there could be other tools (say, code generators) that would take
  // that metadata into account.
  if(paramMirror.metadata.length > 0) {
    Expect.equals('.A',
        MirrorSystem.getName(paramMirror.metadata[0].type.qualifiedName));
  }
}

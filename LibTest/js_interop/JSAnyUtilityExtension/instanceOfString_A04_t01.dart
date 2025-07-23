// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool instanceOfString( String constructorName )
///
/// Whether this [JSAny?] is an `instanceof` the constructor that is defined by
/// `constructorName`, which is looked up in the `globalContext`.
///
/// If `constructorName` contains '.'s, the name is split into several parts in
/// order to get the constructor. For example, `library1.JSClass` would involve
/// fetching `library1` off of the `globalContext`, and then fetching `JSClass`
/// off of `library1` to get the constructor.
///
/// If `constructorName` is empty or any of the parts or the constructor don't
/// exist, returns `false`.
///
/// @description Checks that `instanceOfString()` returns `true` if this
/// `JSAny?` is is an `instanceof` the constructor that is defined by
/// `constructorName`. Test the case when `constructorName` contains '.'.
/// @author sgrekhov22@gmail.com

// OtherResources=module.js
import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

final completer = Completer<String>();

void complete(String value) {
  completer.complete(value);
}

main() {
  globalContext["complete"] = complete.toJS;
  eval(r'''
    var lib1;
    (async () => { 
      // This is path to the module on tryjobs. May not work locally.
      lib1 = await import('/root_dart/tests/co19/src/LibTest/js_interop/JSAnyUtilityExtension/module.js');
      globalThis.objA = new lib1.A(42, "A form JS");
      globalThis.objB = new lib1.B();
      console.log('initialized');
    })().then(function(v) {
      globalThis.complete("");
    });
  ''');
  asyncStart();
  completer.future.then((_) {
    Expect.isTrue(globalContext["objA"].instanceOfString("lib1.A"));
    Expect.isTrue(globalContext["objB"].instanceOfString("lib1.B"));
    asyncEnd();
  });
}

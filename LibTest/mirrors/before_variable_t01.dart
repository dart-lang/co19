/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...  variable declaration ...
 * @description Check that metadata is allowed before variable declaration
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
import '../../Utils/expect.dart';

class A {
  const A();
}

@A() int variable;
@A() const int constVariable = 0;
@A() final int finalVariable = 0;
@A() var dynamicVariable;

main() {
  Symbol emptyName = MirrorSystem.getSymbol('');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(emptyName);
  var varNames = ['variable', 'constVariable', 'finalVariable', 'dynamicVariable'];
  for (var name in varNames) {
    var symbol = MirrorSystem .getSymbol(name);
    DeclarationMirror varMirror = libraryMirror.declarations[symbol];
    Expect.equals('.A',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  }
}

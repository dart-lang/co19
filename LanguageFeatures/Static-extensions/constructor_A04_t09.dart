// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a constructor declaration in an extension which declares a
/// named constructor with name `Name`, it is an error if `Name` is either the
/// name of the extension, or the on-declaration of the extension
///
/// @description Checks that it is not an error if an extension declares a
/// constructor whose name is the name of a type alias whose expansion yields
/// the on-declaration of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {
  final String log;
  C(this.log);
}

typedef CAlias = C;
typedef CAlias2 = CAlias;

extension ExtC on C {
  factory CAlias() => C("CAlias");
}

extension on CAlias {
  factory CAlias2() = C.CAlias;
}

mixin M {
  String log = "";
}

class MO = Object with M;

typedef MAlias = M;

extension ExtM on M {
  factory MAlias() => MO()..log = "MAlias";
}

mixin class MC {
  String log = "";
}

typedef MCAlias = MC;

extension ExtMC on MCAlias {
  factory MCAlias() => MC()..log = "MCAlias";
}

enum E {
  e0, e1;
}

typedef EAlias = E;

extension on E {
  factory EAlias() => E.e1;
}

extension type ET(String log) {
  ET.empty() : this("ETAlias");
}

typedef ETAlias = ET;

extension ExtET on ETAlias {
  factory ETAlias() = ET.empty;
}

class G<T> {
  final Type t;
  G(this.t);
  G.typed() : t = T;
}

typedef GAlias<T> = G<T>;

typedef GAlias2<T> = GAlias<T>;

extension ExtG<T> on G<T> {
  factory GAlias() => G<T>.typed();
}

extension ExtG2<T> on GAlias<T> {
  factory GAlias2() = G<T>.typed;
}

typedef RecordAlias = Record;

extension ExtRecord on Record {
  factory RecordAlias() => (1,);
}

typedef FunctionAlias = Function;

extension on FunctionAlias {
  factory FunctionAlias() => () => 42;
}

main() {
  Expect.equals("CAlias", C.CAlias().log);
  Expect.equals("CAlias", C.CAlias2().log);
  Expect.equals("MAlias", M.MAlias().log);
  Expect.equals("MCAlias", MC.MCAlias().log);
  Expect.equals(E.e1, E.EAlias());
  Expect.equals("ETAlias", ET.ETAlias().log);
  Expect.equals(int, G<int>.GAlias().t);
  Expect.equals(String, G<String>.GAlias2().t);
  Expect.equals((1,), Record.RecordAlias());
  Expect.equals(42, (Function.FunctionAlias() as int Function())());
}

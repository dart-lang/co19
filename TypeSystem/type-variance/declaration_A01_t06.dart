// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a variance modifier is specified
/// for a type parameter declared in the type parameter list of a declaration
/// of an extension, a generic function or method, or a type alias; or in the
/// type parameter list of a generic function type.
///
/// @description Check that it is a compile-time error if a variance modifier is
/// specified for a type parameter declared in the type parameter list of a
/// generic function type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=variance

typedef F1 = void Function<in T>(T t);
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F2 = T Function<out T>();
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef F3 = T Function<inout T>(T t);
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef TypedefSecondTypeParameter = void Function<X, in Y>(X x, Y y);
//                                                    ^^
// [analyzer] unspecified
// [cfe] unspecified

void Function<in T>()? topLevelVariable;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

List<void Function<out T>()> typeArgument = [];
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

void parameterType(void Function<inout T>() f) {}
//                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void Function<in T>()? returnType() => null;
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

void functionTypedParameter1(void g<out T>()) {}
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

void functionTypedParameter2(void g<inout T>()) {}
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef TypedefNoReturnType = Function<in T>(T t);
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified

Function<out T>()? topLevelVariableNoReturnType;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

List<Function<inout T>()> typeArgumentNoReturnType = [];
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void parameterTypeNoReturnType(Function<in T>() f) {}
//                                      ^^
// [analyzer] unspecified
// [cfe] unspecified

Function<out T>()? returnTypeNoReturnType() => null;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

void functionTypedParameterNoReturnType(g<inout T>()) {}
//                                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  void Function<inout T>()? instanceVariable;
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void functionTypedParameter1(void g<in T>()) {}
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified

  void functionTypedParameter2(void g<out T>()) {}
//                                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void functionTypedParameter3(void g<inout T>()) {}
//                                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Function<in T>()? instanceVariableNoReturnType;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  void functionTypedParameterNoReturnType(g<out T>()) {}
//                                          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(F1);
  print(F2);
  print(F3);
  print(TypedefSecondTypeParameter);
  print(topLevelVariable);
  print(typeArgument);
  print(parameterType);
  print(returnType);
  print(functionTypedParameter1);
  print(functionTypedParameter2);
  print(TypedefNoReturnType);
  print(topLevelVariableNoReturnType);
  print(typeArgumentNoReturnType);
  print(parameterTypeNoReturnType);
  print(returnTypeNoReturnType);
  print(functionTypedParameterNoReturnType);
  print(C);
}

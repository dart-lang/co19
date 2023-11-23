// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion complex example with everything
///
/// mixin EnumComparable<T extends Enum> on Enum implements Comparable<T> {
///   int compareTo(T other) => this.index - other.index;
/// }
///
/// // With type argument, mixin and interface.
/// enum Complex<T extends Pattern> with EnumComparable<Complex> implements Pattern {
///   whitespace<RegExp>(r"\s+", RegExp.new),
///   alphanum<RegExp>.captured(r"\w+", RegExp.new),
///   anychar<Glob>("?", Glob.new),
///   ;
///
///   // Static variables. (Could use Expando, this is more likely efficient.)
///   static final List<Pattern?> _patterns = List<Pattern?>.filled(3, null);
///
///   // Final instance variables.
///   final String _patternSource;
///   final T Function(String) _factory;
///
///   // Unnamed constructor. Non-redirecting.
///   const Complex(String pattern, T Function(String) factory)
///       : _patternSource = pattern, _factory = factory;
///
///   // Factory construtor.
///   factory Complex.matching(String text) {
///     for (var value in values) {
///       if (value.allMatches(text).isNotEmpty && value is Complex<T>) {
///         return value;
///       }
///     }
///     throw UnsupportedError("No pattern matching: $text");
///   }
///
///   // Named constructor. Redirecting.
///   const Complex.captured(String regexpPattern)
///       : this("($regexpPattern)", RegExp);
///
///   // Can expose the implicit name.
///   String get name => EnumName(this).name;
///
///   // Instance getter.
///   Pattern get pattern => _patterns[this.index] ??= _factory(_pattern);
///
///   // Instance methods.
///   Iterable<Match> allMatches(String input, [int start = 0]) =>
///       pattern.allMatches(input, start);
///
///   Match? matchAsPrefix(String input, [int start = 0]) =>
///       pattern.matchAsPrefix(input, start);
///
///   // Specifies `toString`.
///   String toString() => "Complex<$T>($_patternSource)";
/// }
///
/// @description Check the example from the specification
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

mixin EnumComparable<T extends Enum> on Enum implements Comparable<T> {
  int compareTo(T other) => this.index - other.index;
}

// With type argument, mixin and interface.
enum Complex<T extends Pattern> with EnumComparable<Complex> implements Pattern {
  whitespace<RegExp>(r"\s+", RegExp.new),
  alphanum<RegExp>.captured(r"\w+", RegExp.new),
  anychar<RegExp>(".", RegExp.new),
  ;

  // Static variables. (Could use Expando, this is more likely efficient.)
  static final List<Pattern?> _patterns = List<Pattern?>.filled(3, null);

  // Final instance variables.
  final String _patternSource;
  final T Function(String) _factory;

  // Unnamed constructor. Non-redirecting.
  const Complex(String pattern, T Function(String) factory)
    : _patternSource = pattern, _factory = factory;

  // Factory constructor.
  factory Complex.matching(String text) {
    for (var value in values) {
      if (value.allMatches(text).isNotEmpty && value is Complex<T>) {
        return value;
      }
    }
    throw UnsupportedError("No pattern matching: $text");
  }

  // Named constructor. Redirecting.
  const Complex.captured(String regexpPattern, T Function(String) factory)
    : this("($regexpPattern)", factory);

  // Can expose the implicit name.
  String get name => EnumName(this).name;

  // Instance getter.
  Pattern get pattern => _patterns[this.index] ??= _factory(_patternSource);

  // Instance methods.
  Iterable<Match> allMatches(String input, [int start = 0]) =>
      pattern.allMatches(input, start);

  Match? matchAsPrefix(String input, [int start = 0]) =>
      pattern.matchAsPrefix(input, start);

  // Specifies `toString`.
  String toString() => "Complex<$T>($_patternSource)";
}

main() {
  Expect.equals("Complex<RegExp>(\\s+)", Complex.whitespace.toString());
  Expect.equals("Complex<RegExp>((\\w+))", Complex.alphanum.toString());
  Expect.equals("Complex<RegExp>(.)", Complex.anychar.toString());
  Expect.isNull(Complex.whitespace.matchAsPrefix("something"));
  Expect.isNotNull(Complex.alphanum.matchAsPrefix("something"));
  Expect.isNotNull(Complex.anychar.matchAsPrefix("Lily was here"));
  Expect.iterableEquals([], Complex.whitespace.allMatches("something"));
  Expect.isTrue(Complex.alphanum.allMatches("something").length > 0);
  Expect.isTrue(Complex.anychar.allMatches("something").length > 0);
  Expect.equals("\\s+", Complex.whitespace._patternSource);
  Expect.equals("(\\w+)", Complex.alphanum._patternSource);
  Expect.equals(".", Complex.anychar._patternSource);
  Expect.equals(Complex._patterns[0], Complex.whitespace.pattern);
  Expect.equals(Complex._patterns[1], Complex.alphanum.pattern);
  Expect.equals(Complex._patterns[2], Complex.anychar.pattern);
  Expect.equals("whitespace", Complex.whitespace.name);
  Expect.equals("alphanum", Complex.alphanum.name);
  Expect.equals("anychar", Complex.anychar.name);
  Complex c = Complex.matching("123");
  Expect.equals(Complex.alphanum, c);
  Expect.equals(0, Complex.alphanum.compareTo(Complex.alphanum));
  Expect.equals(1, Complex.alphanum.compareTo(Complex.whitespace));
  Expect.equals(-1, Complex.alphanum.compareTo(Complex.anychar));
}

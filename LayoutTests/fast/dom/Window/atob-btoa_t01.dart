/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  shouldBeEqualToString(window.atob("YQ=="), 'a');
  shouldBeEqualToString(window.atob("YWI="), 'ab');
  shouldBeEqualToString(window.atob("YWJj"), 'abc');
  shouldBeEqualToString(window.atob("YWJjZA=="), 'abcd');
  shouldBeEqualToString(window.atob("YWJjZGU="), 'abcde');
  shouldBeEqualToString(window.atob("YWJjZGVm"), 'abcdef');

  shouldBeEqualToString(window.btoa("a"), 'YQ==');
  shouldBeEqualToString(window.btoa("ab"), 'YWI=');
  shouldBeEqualToString(window.btoa("abc"), 'YWJj');
  shouldBeEqualToString(window.btoa("abcd"), 'YWJjZA==');
  shouldBeEqualToString(window.btoa("abcde"), 'YWJjZGU=');
  shouldBeEqualToString(window.btoa("abcdef"), 'YWJjZGVm');

  shouldBeEqualToString(window.btoa(""), '');
  shouldBeEqualToString(window.btoa("éé"), '6ek=');
  shouldBeEqualToString(window.btoa("\u0080\u0081"), 'gIE=');
  shouldThrow(() => window.btoa("тест"));

  shouldBeEqualToString(window.atob(""), '');

  // HTML space characters in input.
  shouldBeEqualToString(window.atob(" YQ=="), 'a');
  shouldBeEqualToString(window.atob("YQ== "), 'a');
  shouldBeEqualToString(window.atob("YQ==    "), 'a');
  shouldBeEqualToString(window.atob("YQ==\u000a"), 'a');
  shouldBeEqualToString(window.atob("YQ =="), 'a');
  shouldBeEqualToString(window.atob("YQ\t=="), 'a');
  shouldBeEqualToString(window.atob("YQ\n=="), 'a');
  shouldBeEqualToString(window.atob("YQ\f=="), 'a');
  shouldBeEqualToString(window.atob("YQ\r=="), 'a');
  shouldBeEqualToString(window.atob("YQ\t\n\f\r =="), 'a');

  shouldBeEqualToString(window.atob("6ek="), 'éé');
  shouldBeEqualToString(window.atob("6ek"), 'éé');
  shouldBeEqualToString(window.atob("gIE="), '\u0080\u0081');
  shouldThrow(() => window.atob("тест"));
  shouldThrow(() => window.atob("z"));
  shouldBeEqualToString(window.atob("zz"), 'Ï');
  shouldBeEqualToString(window.atob("zzz"), 'Ï\u003C');
  shouldBeEqualToString(window.atob("zzz="), 'Ï\u003C');
  shouldThrow(() => window.atob("zzz==")); // excess pad characters.
  shouldThrow(() => window.atob("zzz===")); // excess pad characters.
  shouldThrow(() => window.atob("zzz====")); // excess pad characters.
  shouldThrow(() => window.atob("zzz=====")); // excess pad characters.
  shouldBeEqualToString(window.atob("zzzz"), 'Ï\u003Có');
  shouldBeEqualToString(window.atob("            "), ''); // whitespace only.
  shouldThrow(() => window.atob("zzzzz"));
  shouldThrow(() => window.atob("z=zz"));
  shouldThrow(() => window.atob("="));
  shouldThrow(() => window.atob("=="));
  shouldThrow(() => window.atob("==="));
  shouldThrow(() => window.atob("===="));
  shouldThrow(() => window.atob("====="));
}

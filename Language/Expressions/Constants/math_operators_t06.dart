/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • An expression of the form e1 + e2 where e1 and e2 are constant expressions
 *   that evaluate to a numeric or string value or to null.
 * • An expression of one of the forms −e, e1 - e2, e1 * e2, e1 / e2, e1 ˜/ e2,
 *   e1 > e2, e1 < e2, e1 >= e2, e1 <= e2 or e1 % e2, where e, e1 and e2 are
 *   constant expressions that evaluate to a numeric value or to null.
 * @description Checks that various expressions of the specified forms can be
 * used within the initializer list of a constant constructor and are,
 * therefore, constant expressions.
 * @author iefremov
 */

class C {
  const C() :
    a = -1,
    b = -0,
    c = -100500,
    d = -999999999999999999,
    e = -9182319.12394,
    f = -3.14,
    g = -(0.0/0.0),
    h = -(1.0/0.0),
    i = -0.0,

    j = 1 - 2e0,
    k = 1 * 2E-0,
    l = 1 / 2,
    m = 1 > 2,
    n = 1 < 2,
    o = 1 >= 2,
    p = 1 <= 2,
    q = 1 % 2,

    r = 1.42 - 2,
    s = 1.42 * 2,
    t = 1.42 / 2,
    u = 1.42 > 2,
    v = 1.42 < 2,
    w = 1.42 >= 2,
    x = 1.42 <= 2,
    y = 1.42 % 2,

    z = 1 - 2.42,
    aa = 1 * 2.42,
    ab = 1 / 2.42,
    ac = 1 > 2.42,
    ad = 1 < 2.42,
    ae = 1 >= 2.42,
    af = 1 <= 2.42,
    ag = 1 % 2.42,

    ah = 1.42 - 2.42,
    ai = 1.42 * 2.42,
    aj = 1.42 / 2.42,
    ak = 1.42 > 2.42,
    al = 1.42 < 2.42,
    am = 1.42 >= 2.42,
    an = 1.42 <= 2.42,
    ao = 1.42 % 2.42,

    ap = 1.42 ~/ 1.42,
    aq = 5 ~/ 1,
    ar = 0.2 ~/ 2,
    as = 1 ~/ (2 + 1);

    final a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w,
      x, y, z,
      aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar,
      as;
}


main() {
  try {
    const C();
  } catch (ok) {} // NPEs and whatnot
}

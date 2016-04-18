/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double asin(num x)
 * Converts [x] to a double and returns the arc sine of the value.
 *
 * @description Checks returned values on various arguments.
 *
 * @issue 26261
 * @author msyabro
 * @reviewer pagolubev
 * @3rdparty sputnik-v1:S15.8.2.2_A5.js
 * @needsreview Returned value precision is not specified.
 * Checks exact match with values calculated with LibC.
 */
import "../../Utils/expect.dart";
import "dart:math" as Math;

main() {
  int vnum = 64;
  var x = new List(64);
  x[0] = -1.00000000000000000000;
  x[1] = -0.96825396825396826000;
  x[2] = -0.93650793650793651000;
  x[3] = -0.90476190476190477000;
  x[4] = -0.87301587301587302000;
  x[5] = -0.84126984126984128000;
  x[6] = -0.80952380952380953000;
  x[7] = -0.77777777777777779000;
  x[8] = -0.74603174603174605000;
  x[9] = -0.71428571428571430000;
  x[10] = -0.68253968253968256000;
  x[11] = -0.65079365079365081000;
  x[12] = -0.61904761904761907000;
  x[13] = -0.58730158730158732000;
  x[14] = -0.55555555555555558000;
  x[15] = -0.52380952380952384000;
  x[16] = -0.49206349206349209000;
  x[17] = -0.46031746031746035000;
  x[18] = -0.42857142857142860000;
  x[19] = -0.39682539682539686000;
  x[20] = -0.36507936507936511000;
  x[21] = -0.33333333333333337000;
  x[22] = -0.30158730158730163000;
  x[23] = -0.26984126984126988000;
  x[24] = -0.23809523809523814000;
  x[25] = -0.20634920634920639000;
  x[26] = -0.17460317460317465000;
  x[27] = -0.14285714285714290000;
  x[28] = -0.11111111111111116000;
  x[29] = -0.07936507936507941600;
  x[30] = -0.04761904761904767200;
  x[31] = -0.01587301587301592800;
  x[32] = 0.01587301587301581700;
  x[33] = 0.04761904761904767200;
  x[34] = 0.07936507936507930500;
  x[35] = 0.11111111111111116000;
  x[36] = 0.14285714285714279000;
  x[37] = 0.17460317460317465000;
  x[38] = 0.20634920634920628000;
  x[39] = 0.23809523809523814000;
  x[40] = 0.26984126984126977000;
  x[41] = 0.30158730158730163000;
  x[42] = 0.33333333333333326000;
  x[43] = 0.36507936507936511000;
  x[44] = 0.39682539682539675000;
  x[45] = 0.42857142857142860000;
  x[46] = 0.46031746031746024000;
  x[47] = 0.49206349206349209000;
  x[48] = 0.52380952380952372000;
  x[49] = 0.55555555555555558000;
  x[50] = 0.58730158730158721000;
  x[51] = 0.61904761904761907000;
  x[52] = 0.65079365079365070000;
  x[53] = 0.68253968253968256000;
  x[54] = 0.71428571428571419000;
  x[55] = 0.74603174603174605000;
  x[56] = 0.77777777777777768000;
  x[57] = 0.80952380952380953000;
  x[58] = 0.84126984126984117000;
  x[59] = 0.87301587301587302000;
  x[60] = 0.90476190476190466000;
  x[61] = 0.93650793650793651000;
  x[62] = 0.96825396825396814000;
  x[63] = 1.00000000000000000000;


  var y = new List(64);
  y[0] = -1.57079632679489660000;
  y[1] = -1.31814860051033310000;
  y[2] = -1.21253510828227990000;
  y[3] = -1.13082037200397780000;
  y[4] = -1.06135247798300370000;
  y[5] = -0.99962782822935903000;
  y[6] = -0.94334055387170590000;
  y[7] = -0.89112250788665281000;
  y[8] = -0.84208287605149101000;
  y[9] = -0.79560295348453536000;
  y[10] = -0.75123199912663585000;
  y[11] = -0.70862927156238398000;
  y[12] = -0.66752944463583297000;
  y[13] = -0.62772081765791266000;
  y[14] = -0.58903097021627393000;
  y[15] = -0.55131696913188277000;
  y[16] = -0.51445847556118673000;
  y[17] = -0.47835276464925774000;
  y[18] = -0.44291104407363896000;
  y[19] = -0.40805567730127851000;
  y[20] = -0.37371805094291394000;
  y[21] = -0.33983690945412198000;
  y[22] = -0.30635703455691915000;
  y[23] = -0.27322818254063785000;
  y[24] = -0.24040421676925938000;
  y[25] = -0.20784238935334678000;
  y[26] = -0.17550273757572274000;
  y[27] = -0.14334756890536540000;
  y[28] = -0.11134101434096394000;
  y[29] = -0.07944863408513722100;
  y[30] = -0.04763706262440318300;
  y[31] = -0.01587368248995573600;
  y[32] = 0.01587368248995562500;
  y[33] = 0.04763706262440318300;
  y[34] = 0.07944863408513711000;
  y[35] = 0.11134101434096394000;
  y[36] = 0.14334756890536529000;
  y[37] = 0.17550273757572274000;
  y[38] = 0.20784238935334667000;
  y[39] = 0.24040421676925938000;
  y[40] = 0.27322818254063774000;
  y[41] = 0.30635703455691915000;
  y[42] = 0.33983690945412187000;
  y[43] = 0.37371805094291394000;
  y[44] = 0.40805567730127840000;
  y[45] = 0.44291104407363896000;
  y[46] = 0.47835276464925758000;
  y[47] = 0.51445847556118673000;
  y[48] = 0.55131696913188266000;
  y[49] = 0.58903097021627393000;
  y[50] = 0.62772081765791254000;
  y[51] = 0.66752944463583297000;
  y[52] = 0.70862927156238387000;
  y[53] = 0.75123199912663585000;
  y[54] = 0.79560295348453514000;
  y[55] = 0.84208287605149101000;
  y[56] = 0.89112250788665259000;
  y[57] = 0.94334055387170590000;
  y[58] = 0.99962782822935881000;
  y[59] = 1.06135247798300370000;
  y[60] = 1.13082037200397760000;
  y[61] = 1.21253510828227990000;
  y[62] = 1.31814860051033270000;
  y[63] = 1.57079632679489660000;

  for (int i = 0; i < vnum; i++) {
    Expect.equals(y[i], Math.asin(x[i]));
  }
}

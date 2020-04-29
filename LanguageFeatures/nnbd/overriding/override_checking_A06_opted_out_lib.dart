/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
// @dart=2.6

import "dart:async";

class A_OUT<T> { T Function(T) get f => (x) => x; }

class out_int      extends A_OUT<int     > {}
class out_Function extends A_OUT<Function> {}
class out_Object   extends A_OUT<Object  > {}

class out_dynamic extends A_OUT<dynamic> {}
class out_void    extends A_OUT<void   > {}
class out_Null    extends A_OUT<Null   > {}

class out_FutureOr          extends A_OUT<FutureOr          > {}
class out_FutureOr_int      extends A_OUT<FutureOr<int     >> {}
class out_FutureOr_FutureOr extends A_OUT<FutureOr<FutureOr>> {}

class out_Never extends A_OUT<Never> {}


class out_int1      extends A_OUT<int     > {}
class out_Function1 extends A_OUT<Function> {}
class out_Object1   extends A_OUT<Object  > {}

class out_dynamic1 extends A_OUT<dynamic> {}
class out_void1    extends A_OUT<void   > {}
class out_Null1    extends A_OUT<Null   > {}

class out_FutureOr1          extends A_OUT<FutureOr          > {}
class out_FutureOr_int1      extends A_OUT<FutureOr<int     >> {}
class out_FutureOr_FutureOr1 extends A_OUT<FutureOr<FutureOr>> {}

class out_Never1 extends A_OUT<Never> {}

/* Here is a table of test cases:
        Object Object? Object* Int Int? Int* Function Function? Function* Dynamic Dynamic* Void Void*	Null Null* Never Never* FO  FO*	FO<int>	FO<int?> FO<FO>	FO<int>* FO<FO>*
Object	   1      3	     30	    4	  4	  31	     4	     4	        31	      5	      32       5	 32	   5	  32     6    114  65   33	  82	    83      84	    33      33
Object?	   3	    2	     26	    7	  7   27       7      7          27       10       29      11  29	   8	  27	   9	  114	  64	159	  82	    83	    84	    28	   159
Object*	  30	   26	    115	   19	 13	 120	    23      96  	     120	     43	     121	    52	122	  59	 120	 123	  120	  71	124	 106	   107	   108	   120	   124
Int	       4	    7      19	   15	 16   18	    34	    34	        19	     40	      20	    49	 20	  56	  20	 131	  133	  63	 21	  79	    80	    81	    21	    21
Int?	     4	    7	     13	   16	 17	  12	    35	    35	        13	     40	      13	    49	 13	  56	  13	 131	  133	  63	 14	  79	    80	    81	    14	    14
Int*	    31	   27	    120	   18	 12	 115	    23	    96	       125	     44	     125	    53	125	  59	 125   132	  125	  69  125	 103	   104	   105	   129	   125
Function   4      7	     23	   34	 35	  23	    37	    38	        22	     40	      24	    49	 24	  56	  24	 131	  133	  63	 25	  79	    80	    81	    25	    25
Function?  4	    7      96	   34	 35	  96	    38	    36	        97	     40	      98	    49	 98	  56	  98	 131	  133	  63	 99	  79	    80	    81	    99	    99
Function* 31	   27	    120	   19	 13	 125	    22	    97	       115	     44	     126	    53	126	  59	 126	 132	  126	  69  126	 103	   104	   105	   126	   126
Dynamic    5	   10	     43	   40	 40	  44	    40	    40	        44	     39	      46	    42	 47	  41	  44	 135	  136	  67	158	  87	    88	    89	    45	   158
Dynamic*	32     29	    121	   20	 13	 125	    24	    98	       126	     46	     116	   100	130	  60	 127	 137	  138	  70	139	 140	   140	   134	   128     139
Void	     5	   11	     52	   49	 49	  53	    49	    49	        53	     42	     100	    48	 51	  50	  53	 141	  142	  68	 55	  90	    91	    92	   161	    55
Void*	    32	   29	    122	   20	 13	 125	    24	    98	       126	     47	     130	    51	116	  60	 127	 143	  144	  72	147	 146	   146	   148	   128	   147
Null	     5      8	     59	   56	 56	  59	    56	    56	        59	     41       60	    50	 60	  57	  58	 145	  154	  66   61	  93	    94	    95	    61	    61
Null*	    32	   27	    120	   20	 13	 125      24	    98	       126	     44	     127	    53	127	  58	 116	 155	  156	  69  127	 103	   104	   105	   127	   127
Never	     6      9	    123	  131	131	 132     131	   131	       132	    135	     137	   141	143	 145	 155	 119	  157	 150  152	 150	   150	   150	   152	   152
FO	      65	   64	     71	   63	 63	  69	    63      63	        69	     67	      70	    68	 72	  66	  69	 150	  151	  62	 74	 101	   101	   102	    73	   160
FO*       33	  159	    124	   21  14	 125	    25	    99	       126	    158	     139	    55	147	  61	 127	 152	  153	  74	117	 109	   110	   162	   128	   149
FO<int>   82	   82	    106	   79	 79	 103	    79	    79	       103	     87	     140	    90	146	  93	 103	 150	  151  101  109	  75	    78	   111	   112	   109
FO<int?>  83     83	    107	   80	 80  104	    80	    80	       104	     88	     140	    91	146	  94	 104	 150	  151	 101	110	  78	    76	   111	    85	   110
FO<FO>  	84	   84	    108	   81	 81	 105	    81	    81	       105	     89	     134	    92	148	  95	 105	 150	  151	 102  162	 111	   111	    77	   113	    86
FO<int>>* 33	   28	    120	   21	 14	 129	    25	    99	       126	     45	     128	   161	128	  61	 127	 152	  153	  73	128	 112	    85	   113	   117	   128
FO<FO>>*	33	  159	    124	   21	 14	 125	    25	    99	       126	    158	     139	    55	147	  61	 127	 152	  153	 160	149	 109	   110	    86	   128	   117
*/
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a try statement of the form try s1 on − catch1 . . . on − catchn
 * ﬁnally sf; proceeds as follows:
 *   The statement s1 is executed in the dynamic scope of the exception handler
 * deﬁned by the try statement. Then, the ﬁnally clause is executed.
 *   Whether any of the on-catch clauses is executed depends on whether a matching
 * exception has been raised by s1 (see the speciﬁcation of the throw statement).
 *   If s1 has raised an exception, it will transfer control to the try statements handler,
 * which will examine the catch clauses in order for a match as speciﬁed above. If no
 * matches are found, the handler will execute the ﬁnally clause.
 *   If a matching on-catch was found, it will execute ﬁrst, and then the ﬁnally
 * clause will be executed.
 * @author TODO
 */

void main() {
}

class A<T extends A<T>> {
  const A();
}

const b1 = 1 is A;
const b2 = 1 is A<dynamic>;
const b3 = 1 is A<Null>;
const b4 = 1 is A<void>;

const b5 = 1 is A<A>;
const b6 = 1 is A<A<dynamic>>;
const b7 = 1 is A<A<Null>>;
const b8 = 1 is A<A<void>>;

main() {
}


Type typeOf<X>() => X;
typedef G<X> = X Function(X);
class A<X extends G<A<X>>> {}
main() {
  print(typeOf<A<G<A<dynamic>>>>());
  print(typeOf<A>());
}

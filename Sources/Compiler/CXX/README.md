#  C++ transpilation

## Anatomy of a transpiled function

The body of a transpiled function is divided into two sections.
The first is called the *allocation section* and declares all the local variables of the function.
The second is called the *instruction section* and describes the semantics of the function.
For example:

```c++
P3Int P3IntF3u2b11_a(P3Int* l0, P3Int* l1){
  int64_t* l2;
  int64_t* l3;
  int64_t l4;
bb0:
  l2 = &l0->_0;
  l3 = &l1->_0;
  l4 = Val::Builtin::i64_add(l2, l3);
  P3Int l5{l4};
  return l5;
}
```

## Implementation notes

A Val module is transpiled as a C++ compilation unit, composed of one header and one source file.
All transpiled symbols are defined in the module namespace.
The header of a transpiled unit exposes the public symbols of the module through a C++ API.

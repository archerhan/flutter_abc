import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';


void main() {

//  breakContiniue();

//  switchExample(1);

//  runDog();

//  final a = Testoperator(2, 3);
//  final b = Testoperator(2, 2);
//  var num1 = Testoperator(4, 5);
//  var num2= Testoperator(0,1);
//  print(a + b == num1); // true
//  print(a - b == num2); // true


//  TestMethod test = new TestMethod();
//  dynamic f = test.foo;
//  // Invokes `Object.noSuchMethod`, not `TestMethod.noSuchMethod`, so it throws.
//  f(42);


  print(sayHello(Person('李四'))); // 你好 张三. 我是 李四.
  print(sayHello(PersonImpl())); // 你好 张三  你知道我是谁吗？


  var test = new Test();
  var result = test(166.6665,"Flutter真好玩",672);
  print("$result");// 666.666 Flutter真好玩 666


}


void breakContiniue() {
  //以下两种描述是等价的：

// 使用 continue
  for (int i = 0; i < 10; i++) {
    if (i.isEven) continue;
    print(i);
  }

// 使用 break.
  for (int i = 0; i < 10; i++) {
    labels: {
      // isEven 当且仅当该整数为偶数时才返回true
      if (i.isEven) break labels;
      print(i);
    }
  }
}

void switchExample(int foo) {
  switch (foo) {
    shared:
    case 0:
      print("foo is 0");
      break;
    case 1:
      print("foo is 1");
      continue shared; // Continue使用在被标记为shared的子句中
    case 2:
      print("foo is either 1 or 2");
      break;
  }
}

void runDog() {
  int age = 0;
  int hungry = 0;
  int tired = 0;

  bool seesSquirrel() => new Random().nextDouble() < 0.1;
  bool seesMailman() => new Random().nextDouble() < 0.1;

  switch (1) {
    start:
    case 0:
      print("dog 方法已经开始");
      print('case 0 ==> age: $age');
      print('case 0 ==> hungry: $hungry');
      print('case 0 ==> tired: $tired');
      continue doDogThings;

    sleep:
    case 1:
      print("sleeping");
      tired = 0;
      age++;
      if (age > 20) break;
      print('case 1 ==> age: $age');
      print('case 1 ==> hungry: $hungry');
      print('case 1 ==> tired: $tired');
      continue doDogThings;

    doDogThings:
    case 2:
      if (hungry > 2) continue eat;
      if (tired > 3) continue sleep;
      if (seesSquirrel()) continue chase;
      if (seesMailman()) continue bark;
      print('case 2 ==> age: $age');
      print('case 2 ==> hungry: $hungry');
      print('case 2 ==> tired: $tired');
      continue play;

    chase:
    case 3:
      print("chasing");
      hungry++;
      tired++;
      print('case 3 ==> age: $age');
      print('case 3 ==> hungry: $hungry');
      print('case 3 ==> tired: $tired');
      continue doDogThings;

    eat:
    case 4:
      print("eating");
      hungry = 0;
      print('case 4 ==> age: $age');
      print('case 4 ==> hungry: $hungry');
      print('case 4 ==> tired: $tired');
      continue doDogThings;

    bark:
    case 5:
      print("barking");
      tired++;
      print('case 5 ==> age: $age');
      print('case 5 ==> hungry: $hungry');
      print('case 5 ==> tired: $tired');
      continue doDogThings;

    play:
    case 6:
      print("playing");
      tired++;
      hungry++;
      print('case 6 ==> age: $age');
      print('case 6 ==> hungry: $hungry');
      print('case 6 ==> tired: $tired');
      continue doDogThings;
  }
}


class Testoperator {
  final int x, y;

  Testoperator(this.x, this.y);

  Testoperator operator +(Testoperator o) => Testoperator(x + o.x, y + o.y);
  Testoperator operator -(Testoperator o) => Testoperator(x - o.x, y - o.y);

  // Override hashCode using strategy from Effective Java, Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + x.hashCode;
    result = 37 * result + y.hashCode;
    return result;
  }

  // 如果重写了 hashCode，应该重写==操作符。
  @override
  bool operator ==(dynamic other) {
    if (other is! Testoperator) return false;
    Testoperator person = other;
    return (person.x == x &&
        person.y == y);
  }
}

///no such method
class TestMethod {
// 除非你重写noSuchMethod，否则使用不存在的成员会导致NoSuchMethodError
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
  dynamic foo();
}

// Person类 隐式接口包含hello()
class Person {
  // 在接口中，但是仅在此库中可见。
  final _name;

  // 不在接口中,因为这是一个构造函数
  Person(this._name);

  // 在接口中
  String hello(String who) => '你好 $who. 我是 $_name.';
}

// Person接口的实现
class PersonImpl implements Person {

  get _name => '';

  String hello(String name) => '你好 $name  你知道我是谁吗？';

}

String sayHello(Person person) => person.hello('张三');


//可调用的类（`Callable Class`）
class Test {
  // 必须是call函数
  call(double a, String b, int c) => '${a*4} ${b} ${c-6}';
}
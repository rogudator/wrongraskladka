import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrong Raskladka',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 22, 101, 11)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'WrongRaskladka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _startingText = RandomWord().getCorruptedVersion();
  final engToRusKeyboard = WrongLayout().engToRus;
  final kk = KeyboardKeys();
  int schetchik = 0;

  void _incrementCounter(String l, GlobalKey<ShakeWidgetState> shaker) {
    setState(() {
      final correctLetter = engToRusKeyboard[_startingText[schetchik]];
      if (correctLetter == l) {
        _startingText = _startingText.replaceRange(schetchik, schetchik + 1, l);
        schetchik++;
      } else {
        shaker.currentState?.shake();
      }
      if (schetchik == _startingText.length) {
        _startingText = RandomWord().getCorruptedVersion();
        schetchik = 0;
      }
    });
  }

  final _shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShakeWidget(
              key: _shakeKey,
              shakeCount: 3,
              shakeOffset: 10,
              shakeDuration: const Duration(milliseconds: 400),
              child: Text(
                _startingText,
                style: const TextStyle(
                  fontSize: 56,
                  
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...kk.rusKeys[0].map((key) => SizedBox(
                    width: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 31 : MediaQuery.of(context).size.width / kk.rusKeys[0].length),
                    height: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 38 : (MediaQuery.of(context).size.width / kk.rusKeys[0].length) * 1.2),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                            minimumSize: Size.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          _incrementCounter(key, _shakeKey);
                        },
                        child: Text(
                          key.toUpperCase(),
                          textScaleFactor: 0.9
                        )),
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...kk.rusKeys[1].map((key) => SizedBox(
                    width: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 31 : MediaQuery.of(context).size.width / kk.rusKeys[0].length),
                    height: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 38 : (MediaQuery.of(context).size.width / kk.rusKeys[0].length) * 1.2),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                            minimumSize: Size.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          _incrementCounter(key, _shakeKey);
                        },
                        child: Text(
                          key.toUpperCase(),
                          textScaleFactor: 0.9
                        )),
                  ))
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...kk.rusKeys[2].map((key) => SizedBox(
                    width: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 31 : MediaQuery.of(context).size.width / kk.rusKeys[0].length),
                    height: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? 38 : (MediaQuery.of(context).size.width / kk.rusKeys[0].length) * 1.2),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                            minimumSize: Size.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {
                          _incrementCounter(key, _shakeKey);
                        },
                        child: Text(
                          key.toUpperCase(),
                          textScaleFactor: 0.9
                        )),
                  ))
            ]),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class WrongLayout {
  Map<String, String> engToRus = {
    'q': 'й',
    'w': 'ц',
    'e': 'у',
    'r': 'к',
    't': 'е',
    'y': 'н',
    'u': 'г',
    'i': 'ш',
    'o': 'щ',
    'p': 'з',
    '[': 'х',
    ']': 'ъ',
    'a': 'ф',
    's': 'ы',
    'd': 'в',
    'f': 'а',
    'g': 'п',
    'h': 'р',
    'j': 'о',
    'k': 'л',
    'l': 'д',
    ';': 'ж',
    '\'': 'э',
    'z': 'я',
    'x': 'ч',
    'c': 'с',
    'v': 'м',
    'b': 'и',
    'n': 'т',
    'm': 'ь',
    ',': 'б',
    '.': 'ю',
    '/': '.'
  };
  Map<String, String> rusToEng = {
    'й': 'q',
    'ц': 'w',
    'у': 'e',
    'к': 'r',
    'е': 't',
    'н': 'y',
    'г': 'u',
    'ш': 'i',
    'щ': 'o',
    'з': 'p',
    'х': '[',
    'ъ': ']',
    'ф': 'a',
    'ы': 's',
    'в': 'd',
    'а': 'f',
    'п': 'g',
    'р': 'h',
    'о': 'j',
    'л': 'k',
    'д': 'l',
    'ж': ';',
    'э': '\'',
    'я': 'z',
    'ч': 'x',
    'с': 'c',
    'м': 'v',
    'и': 'b',
    'т': 'n',
    'ь': 'm',
    'б': ',',
    'ю': '.',
    '.': '/'
  };
}

class KeyboardKeys {
  List<List<String>> engKeys = [
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\''],
    ['z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/'],
  ];
  List<List<String>> rusKeys = [
    ['й', 'ц', 'у', 'к', 'е', 'н', 'г', 'ш', 'щ', 'з', 'х', 'ъ'],
    ['ф', 'ы', 'в', 'а', 'п', 'р', 'о', 'л', 'д', 'ж', 'э'],
    ['я', 'ч', 'с', 'м', 'и', 'т', 'ь', 'б', 'ю', '.'],
  ];
}

class RandomWord {
  List<String> rusDictionary = [
    'привет',
    'кадет',
    'ватружка',
    'монетка',
    'свидание',
    'рыбка',
    'компьютер',
    'бегемот',
    'машина',
    'кошка',
    'собака',
    'дом',
    'книга',
    'стул',
    'стол',
    'телефон',
    'карта',
    'планета',
    'космос',
    'футбол',
    'школа',
    'учитель',
    'ученик',
    'дерево',
    'парк',
    'цветок',
    'красота',
    'здоровье',
    'человек',
    'детство',
    'счастье',
    'любовь',
    'дружба',
    'природа',
    'озеро',
    'река',
    'гора',
    'солнце',
    'луна',
    'звезда',
    'ветер',
    'дождь',
    'снег',
    'море',
    'пляж',
    'песок',
    'остров',
    'птица',
    'рыба',
    'животное',
  ];
  String getCorruptedVersion() {
    final ks = WrongLayout();
    final r = Random();
    final answer = rusDictionary[r.nextInt(50)];
    String corruptedAnswer = '';
    for (int i = 0; i < answer.length; i++) {
      String a = answer[i].toString();
      corruptedAnswer += ks.rusToEng[a].toString();
    }
    return corruptedAnswer;
  }
}

class SineCurve extends Curve {
  SineCurve({this.count = 3});
  final double count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t);
  }
}

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);
  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 500),
  }) : super(key: key);
  // 1. pass a child widget
  final Widget child;
  // 2. configurable properties
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;

  // 3. pass the shakeDuration as an argument to ShakeWidgetState. See below.
  @override
  ShakeWidgetState createState() => ShakeWidgetState(shakeDuration);
}

class ShakeWidgetState extends AnimationControllerState<ShakeWidget> {
  ShakeWidgetState(Duration duration) : super(duration);
  // 1. create a Tween
  late Animation<double> _sineAnimation = Tween(
    begin: 0.0,
    end: 1.0,
    // 2. animate it with a CurvedAnimation
  ).animate(CurvedAnimation(
    parent: animationController,
    // 3. use our SineCurve
    curve: SineCurve(count: widget.shakeCount.toDouble()),
  ));

  @override
  Widget build(BuildContext context) {
    // 1. return an AnimatedBuilder
    return AnimatedBuilder(
      // 2. pass our custom animation as an argument
      animation: _sineAnimation,
      // 3. optimization: pass the given child as an argument
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          // 4. apply a translation as a function of the animation value
          offset: Offset(_sineAnimation.value * widget.shakeOffset, 0),
          // 5. use the child widget
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // 1. register a status listener
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    // 2. dispose it when done
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    // 3. reset animationController when the animation is complete
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }
}


## Dependencies

Package que normaliza todas as dependências do projeto.

Por exemplo, as seguintes dependências estão exportadas:

```dart
export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';
export 'package:flutter_triple/flutter_triple.dart';
```
Por elas estarem exportadas, posso acessá-las apenas com o import `import 'package:dependencies/dependencies.dart'`. As dependências não exportadas são as que, de alguma forma, geram conflitos com alguma outra dependência. Nesse caso _dartz_ não foi exportado pois entra em conflito com o _flutter\_modular_ que tem uma classe _Bind_ definida. Mas por ser uma dependência transitiva, é possível importar o _dartz_ diretamente pelo import padrão `import 'package:dartz/dartz.dart'`.

A dependência _timeago_ não foi exportada porque ainda não é possível realizar exports nomeados.
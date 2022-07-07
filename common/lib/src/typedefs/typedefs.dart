import 'package:dependencies/dependencies.dart';

import '../models/menu_item_model.dart';
import '../models/news_model.dart';
import '../models/post/post_model.dart';

typedef MenuItems = List<MenuItemModel>;
typedef News = List<NewsModel>;
typedef UserChangesCallback = Function(User? user);
typedef Posts = List<PostModel>;

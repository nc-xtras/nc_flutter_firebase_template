import 'package:flutter/material.dart';
import 'package:nc_flutter_firebase_template/dt_domains/_models/_index.dart';
import 'package:nc_flutter_firebase_template/ui_screens/a.products/b.product_detail/_index.dart';
import 'package:nc_flutter_firebase_template/ui_screens/a.products/c.product_add/_index.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../app/_index.dart';
import '../../../dt_domains/a.product/_index.dart';
import '../../../xtras/_index.dart';

part 'a.product_list.data.dart';
part 'b.product_list.ctrl.dart';
part 'c.product_list.view.dart';
part 'widgets/a.product_list.appbar.dart';
part 'widgets/b.product_list.fab.dart';
part 'widgets/c.product_list.dart';
part 'widgets/d.product_load.dart';
part 'widgets/e.product_list.echo.dart';

ProductListData get _dt => Data.productList.st;
ProductListCtrl get _ct => Ctrl.productList;

ProductProv get _pv => Prov.product.st;
ProductServ get _sv => Serv.product;
// ProductRepo get _rp => Repo.product.st;

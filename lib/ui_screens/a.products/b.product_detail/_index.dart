import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nc_flutter_firebase_template/dt_domains/_models/_index.dart';
import 'package:nc_flutter_firebase_template/dt_domains/a.product/_index.dart';
import 'package:nc_flutter_firebase_template/ui_screens/a.products/d.product_edit/_index.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../app/_index.dart';
import '../../../xtras/_index.dart';

part 'a.product_detail.data.dart';
part 'b.product_detail.ctrl.dart';
part 'c.product_detail.view.dart';
part 'widgets/a.product_detail.appbar.dart';
part 'widgets/b.product_detail.fab.dart';
part 'widgets/c.product_detail.charlie.dart';
part 'widgets/d.product_detail.delta.dart';
part 'widgets/e.product_detail.echo.dart';

ProductDetailData get _dt => Data.productDetail.st;
ProductDetailCtrl get _ct => Ctrl.productDetail;
ProductProv get _pv => Prov.product.st;
ProductServ get _sv => Serv.product;

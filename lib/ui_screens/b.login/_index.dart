import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nc_flutter_firebase_template/dt_domains/_index.dart';
import 'package:nc_flutter_firebase_template/ui_screens/a.products/a.product_list/_index.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.login.data.dart';
part 'b.login.ctrl.dart';
part 'c.login.view.dart';
part 'widgets/a.login.appbar.dart';
part 'widgets/b.login.fab.dart';
part 'widgets/c.login.charlie.dart';
part 'widgets/d.login.delta.dart';
part 'widgets/e.login.echo.dart';

LoginData get _dt => Data.login.st;
LoginCtrl get _ct => Ctrl.login;
AuthProv get _pv => Prov.auth.st;
AuthServ get _sv => Serv.auth;

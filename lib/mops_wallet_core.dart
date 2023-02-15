// ignore_for_file: depend_on_referenced_packages

library mops_wallet_core;

import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:flutter/foundation.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:coinslib/coinslib.dart';
import 'package:eip55/eip55.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

part './service/wallet_service.dart';
part './database/wallet_database.dart';
part './model/wallet_model.dart';

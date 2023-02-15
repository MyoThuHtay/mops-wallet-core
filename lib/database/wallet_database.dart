part of mops_wallet_core;




class WalletDatabase {
  static final WalletDatabase instance = WalletDatabase._init();

  static Database? _database;
  WalletDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('wallets.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
CREATE TABLE $walletTables ( 
  ${WalletFields.id} $idType,
  ${WalletFields.isCreated} $boolType, 
  ${WalletFields.wallets} $textType,
  ${WalletFields.private} $textType,
  ${WalletFields.btc.toString()} $textType,
  ${WalletFields.eth.toString()} $textType,
  ${WalletFields.ltc.toString()} $textType,
  ${WalletFields.via.toString()} $textType,
  ${WalletFields.grs.toString()} $textType,
  ${WalletFields.dgb.toString()} $textType,
  ${WalletFields.etc.toString()} $textType,
  ${WalletFields.poa.toString()} $textType,
  ${WalletFields.aion.toString()} $textType,
  ${WalletFields.theta.toString()} $textType,
  ${WalletFields.vet.toString()} $textType,
  ${WalletFields.clo.toString()} $textType,
  ${WalletFields.tomo.toString()} $textType,
  ${WalletFields.tt.toString()} $textType,
  ${WalletFields.go.toString()} $textType,
  ${WalletFields.wan.toString()} $textType,
  ${WalletFields.phrase} $textType,
  ${WalletFields.xpud} $textType
  )
''');
  }

  Future<Wallets> create(Wallets wallet) async {
    final db = await instance.database;
    final id = await db.insert(walletTables, wallet.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return wallet.copy(id: id);
  }

  Future<Wallets> readWallet(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      walletTables,
      columns: WalletFields.values,
      where: ' ${WalletFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Wallets.fromJson(maps.first);
    } else {
      throw Exception('Wallet: $id NOT FOUND');
    }
  }

  Future<List<Wallets>> readAllWallets() async {
    final db = await instance.database;
    const orderBy = '${WalletFields.id} ASC';
    final result = await db.query(walletTables, orderBy: orderBy);

    return result.map((json) => Wallets.fromJson(json)).toList();
  }

  Future<int> update(Wallets wallet) async {
    final db = await instance.database;
    return db.update(walletTables, wallet.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: '${WalletFields.id} = ?',
        whereArgs: [wallet.id]);
  }

  Future<int> delete(int? id) async {
    final db = await instance.database;
    return await db
        .delete(walletTables, where: '${WalletFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

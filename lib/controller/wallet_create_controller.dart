part of mops_wallet_core;

class WalletCreate {
  
  late int _lastId;
  int get lastId => _lastId;

  WalletManager service = WalletManager();

  Future<Wallets> getWallet(int id) async {
    Wallets wallet;
    wallet = await WalletDatabase.instance.readWallet(id);
    return wallet;
  }

  Future getWalletId() async {
    final wallets = await WalletDatabase.instance.readAllWallets();
    if (wallets.isNotEmpty) {
      _lastId = wallets.last.id ?? 1;
    } else {
      _lastId = 1;
    }
    return _lastId;
  }

  Future<Wallets> createWallet( String name, String mnemonic) async {
    WalletCreate controller = WalletCreate();
    controller._lastId = await getWalletId();
    final id = controller.lastId + 1;
    final private = await compute(service.getPrivateKey, mnemonic);
    final xpud = await compute(service.getXprvKey, mnemonic);
    final addresses = await compute(service.getEvmAddress, mnemonic);
    final addresses2 = await compute(service.getAddress, mnemonic);
    const isCreated = true;
    final createWallet = Wallets(
      id: id,
      phrase: mnemonic.toString(),
      private: private.toString(),
      eth: addresses[0].toString(),
      etc: addresses[1].toString(),
      poa: addresses[2].toString(),
      aion: addresses[3].toString(),
      theta: addresses[4].toString(),
      vet: addresses[5].toString(),
      clo: addresses[6].toString(),
      tomo: addresses[7].toString(),
      tt: addresses[8].toString(),
      go: addresses[9].toString(),
      wan: addresses[10].toString(),
      btc: addresses2[0].toString(),
      ltc: addresses2[1].toString(),
      via: addresses2[2].toString(),
      grs: addresses2[3].toString(),
      dgb: addresses2[4].toString(),
      xpud: xpud.toString(),
      wallets: name,
      isCreated: isCreated,
    );
    await WalletDatabase.instance.create(createWallet);
    return createWallet;
  }
}

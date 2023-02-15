part of mops_wallet_core;

class MopsWalletCore {
  String generateMnemonic() {
    var mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  bool validateMnemonic(String mnemonic) {
    final valid = bip39.validateMnemonic(mnemonic);
    if (valid != true) return false;
    return valid;
  }

  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    return privateKey;
  }

  Future<String> getXprvKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final node = bip32.BIP32.fromSeed(seed);
    final xPrv = node.derivePath("m/44'/60'/0'/0").toBase58();

    return xPrv;
  }

  Future<List<String>> getethAddress(String mnemonic) async {
    final List<String> addresses = [];
    final path = [
      "m/44'/60'/0'/0/0", //eth,bsc,matic
      "m/44'/61'/0'/0/0", //etc
      "m/44'/178'/0'/0/0", //poa
      "m/44'/425'/0'/0/0", //aion
      "m/44'/500'/0'/0/0", //theta
      "m/44'/818'/0'/0/0", //vet
      "m/44'/820'/0'/0/0", //callisto(clo)
      "m/44'/889'/0'/0/0", //tomo
      "m/44'/1001'/0'/0/0", //thunder token
      "m/44'/6060'/0'/0/0", //gochain
      "m/44'/5718350'/0'/0/0" //wanchain
    ];

    final valid = bip39.validateMnemonic(mnemonic);
    if (valid != true) throw Exception('No Valid mnemonic');
    final seed = bip39.mnemonicToSeedHex(mnemonic);
    Chain chain = Chain.seed(seed);
    for (int i = 0; i < path.length; i++) {
      ExtendedKey key = chain.forPath(path[i]);
      EthPrivateKey privateKey = EthPrivateKey.fromHex(key.privateKeyHex());
      EthereumAddress address = await privateKey.extractAddress();
      final eipAddress = toEIP55Address(address.toString());
      addresses.add(eipAddress);
    }
    return addresses;
  }

  

  Future<List<String>> getAddress(String mnemonic) async {
    List bech32 = [
    'bc',
    'ltc',
    //'dc',
    'via',
    'grs',
    //'bnb',
    'dgb',
  ];
  var derivePath = [
    "m/84'/0'/0'/0/0", //bitcoin
    "m/84'/2'/0'/0/0", //litecoin
    //"m/44'/3'/0'/0/0", //dogecoin not working
    "m/84'/14'/0'/0/0", // viacoin
    "m/84'/17'/0'/0/0", //grs coin
    //"m/44'/714'/0'/0/0", //BNB BEP-2 not working
    // "m/44'/195'/0'/0/0",
    // "m/44'/133'/0'/0/0",
    "m/84'/20'/0'/0/0",//digibyte coin
    // "m/0/0",
    // "m/44'/165'/0'/0/0"
  ];
  List<String> messagePrefix = [
    '\x19Bitcoin Signed Message:\n',
    '\x19Litecoin Signed Message:\n',
    '\x19Dogecoin Signed Message:\n',
    '\x19Bitcoin Signed Message:\n',
    '\x19Bitcoin Signed Message:\n',
    // '\x19Bitcoin Signed Message:\n',
    // '\x19Bitcoin Signed Message:\n',
  ];
  List bip32List = [
    Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    Bip32Type(public: 0x019da462, private: 0x019d9cfe),
    Bip32Type(public: 0x02facafd, private: 0x02fac398),
    Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    // Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    // Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
  ];
  List pubKeyHash = [
    0x00,
    0x30,
    0x1e,
    0x00,
    0x00,
    // 0x00,
    // 0x00,
    // 0x00,
    // 0x00,
  ];
  List scriptHash = [
    0x05,
    0x32,
    0x16,
    0x05,
    0x05,
    0x05,
    // 0x05,
    // 0x05,
    // 0x05,
  ];
  List wif = [
    0x80,
    0xb0,
    0x9e,
    0x80,
    0x80,
    0x80,
    // 0x80,
    // 0x80,
    // 0x80,
  ];
  List opreturnSize = [
    80,
    80,
    80,
    80,
    80,
    80,
    // 80,
    // 80,
    // 80,
  ];

  List<String> addressList = [];
    final valid = bip39.validateMnemonic(mnemonic);
    if (valid != true) throw Exception('No Valid mnemonic');
    for (int i = 0; i < derivePath.length; i++) {
      NetworkType network = NetworkType(
          messagePrefix: messagePrefix[i],
          bech32: bech32[i],
          bip32: bip32List[i],
          pubKeyHash: pubKeyHash[i],
          scriptHash: scriptHash[i],
          wif: wif[i],
          opreturnSize: opreturnSize[i]);
      final seed = bip39.mnemonicToSeed(mnemonic);
      final root = bip32.BIP32.fromSeed(seed);

      final key = root.derivePath(derivePath[i]);

      final address = P2WPKH.fromPublicKey(key.publicKey).address(network);
      addressList.add(address);
      if (kDebugMode) {
        print(addressList.toString());
      }
    }
    return addressList;
  }
}

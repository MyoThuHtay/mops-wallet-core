part of mops_wallet_core;

const String walletTables = 'Wallets';

class WalletFields {
  static final List<String> values = [
    id,
    isCreated,
    wallets,
    private,
    phrase,
    xpud,
    btc,
    eth,
    etc,
    ltc,
    via,
    vet,
    go,
    grs,
    dgb,
    poa,
    aion,
    theta,
    tomo,
    tt,
    clo,
    wan
  ];
  static const String id = '_id';
  static const String isCreated = '_isCreated';
  static const String wallets = '_wallets';
  static const String private = '_private';
  static const String btc = '_btc';
  static const String eth = '_eth';
  static const String etc = '_etc';
  static const String ltc = '_ltc';
  static const String via = '_via';
  static const String grs = '_grs';
  static const String dgb = '_dgb';
  static const String poa = '_poa';
  static const String aion = '_aion';
  static const String theta = '_theta';
  static const String vet = '_vet';
  static const String clo = '_clo';
  static const String tomo = '_tomo';
  static const String tt = '_tt';
  static const String go = '_go';
  static const String wan = '_wan';
  static const String phrase = '_phrase';
  static const String xpud = '_xpud';
}

class Wallets {
  final int? id;
  final bool isCreated;
  final String wallets,
      private,
      btc,
      eth,
      etc,
      ltc,
      via,
      vet,
      go,
      grs,
      dgb,
      poa,
      aion,
      theta,
      tomo,
      tt,
      clo,
      wan,
      phrase,
      xpud;

  const Wallets({
    this.id,
    required this.isCreated,
    required this.wallets,
    required this.private,
    required this.btc,
    required this.eth,
    required this.etc,
    required this.ltc,
    required this.vet,
    required this.via,
    required this.go,
    required this.grs,
    required this.dgb,
    required this.poa,
    required this.aion,
    required this.theta,
    required this.tomo,
    required this.tt,
    required this.clo,
    required this.wan,
    required this.phrase,
    required this.xpud,
  });

  static Wallets fromJson(Map<String, dynamic> json) {
    return Wallets(
      id: json[WalletFields.id] as int?,
      isCreated: json[WalletFields.isCreated] == 1,
      private: json[WalletFields.private] as String,
      xpud: json[WalletFields.xpud] as String,
      wallets: json[WalletFields.wallets] as String,
      phrase: json[WalletFields.phrase] as String,
      btc: json[WalletFields.btc] as String,
      eth: json[WalletFields.eth] as String,
      etc: json[WalletFields.etc] as String,
      ltc: json[WalletFields.ltc] as String,
      vet: json[WalletFields.vet] as String,
      via: json[WalletFields.via] as String,
      go: json[WalletFields.go] as String,
      grs: json[WalletFields.grs] as String,
      dgb: json[WalletFields.dgb] as String,
      poa: json[WalletFields.poa] as String,
      aion: json[WalletFields.aion] as String,
      theta: json[WalletFields.theta] as String,
      tomo: json[WalletFields.tomo] as String,
      tt: json[WalletFields.tt] as String,
      clo: json[WalletFields.clo] as String,
      wan: json[WalletFields.wan] as String,
    );
  }

  Map<String, Object?> toJson() => {
        WalletFields.id: id,
        WalletFields.isCreated: isCreated ? 1 : 0,
        WalletFields.wallets: wallets,
        WalletFields.private: private,
        WalletFields.phrase: phrase,
        WalletFields.xpud: xpud,
        WalletFields.btc: btc,
        WalletFields.eth: eth,
        WalletFields.etc: etc,
        WalletFields.ltc: ltc,
        WalletFields.dgb: dgb,
        WalletFields.go: go,
        WalletFields.grs: grs,
        WalletFields.poa: poa,
        WalletFields.aion: aion,
        WalletFields.theta: theta,
        WalletFields.tomo: tomo,
        WalletFields.tt: tt,
        WalletFields.vet: vet,
        WalletFields.via: via,
        WalletFields.clo: clo,
        WalletFields.wan: wan,
      };

  Wallets copy({
    int? id,
    bool? isCreated,
    String? wallets,
    String? private,
    String? btc,
    String? eth,
    String? etc,
    String? ltc,
    String? via,
    String? vet,
    String? go,
    String? grs,
    String? dgb,
    String? poa,
    String? aion,
    String? theta,
    String? tomo,
    String? tt,
    String? clo,
    String? wan,
    String? phrase,
    String? xpud,
  }) =>
      Wallets(
        id: id ?? this.id,
        isCreated: isCreated ?? this.isCreated,
        wallets: wallets ?? this.wallets,
        private: private ?? this.private,
        btc: btc ?? this.btc,
        eth: eth ?? this.eth,
        etc: etc ?? this.etc,
        ltc: ltc ?? this.ltc,
        vet: vet ?? this.vet,
        via: via ?? this.via,
        go: go ?? this.go,
        grs: grs ?? this.grs,
        dgb: dgb ?? this.dgb,
        poa: poa ?? this.poa,
        aion: aion ?? this.aion,
        theta: theta ?? this.theta,
        tomo: tomo ?? this.tomo,
        tt: tt ?? this.tt,
        clo: clo ?? this.clo,
        wan: wan ?? this.wan,
        phrase: phrase ?? this.phrase,
        xpud: xpud ?? this.xpud,
      );

//   static Map<String, dynamic> toMap(Wallet wallet) => {
//         'id': wallet.id,
//         'private': wallet.private,
//         'public': wallet.public,
//         'phrase': wallet.phrase,
//         'xpud': wallet.xpud,
//         'wallet': wallet.wallets,
//       };
//
//   static String encode(List<Wallet> wallets) => json.encode(
//         wallets
//             .map<Map<String, dynamic>>((wallet) => Wallet.toMap(wallet))
//             .toList(),
//       );
//
//   static List<Wallet> decode(String wallets) =>
//       (json.decode(wallets) as List<dynamic>)
//           .map<Wallet>((item) => Wallet.fromJson(item))
//           .toList();
}

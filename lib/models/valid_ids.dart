class ValidIdStore {
  static Map<String, int> get data => {
        '100001Z': 1,
        '100002Z': 2,
        '100003Z': 3,
        '100004Z': 0,
        '100006Z': 1,
        '100007Z': 2,
        '100008Z': 3,
        '100009Z': 0,
        '170081L': 1,
        '170074T': 2,
        '170153K': 3,
        '170031K': 0,
        '170176H': 1,
        '170275K': 2,
        '170396G': 3,
        '170109H': 0,
        '170589C': 2,
        // 18 Batch - Team 1
        '180459M': 0,
        '180629K': 0,
        '180176R': 0,
        '180573G': 0,
        '180431V': 0,
        '180653D': 0,
        '180722N': 0,
        '180003L': 0,
        '180643X': 0,
        '180276A': 0,
        '180212C': 0,
        '180535T': 0,
        '180070L': 0,
        '180668D': 0,
        '180561T': 0,
        '180638L': 0,
        '180476L': 0,
        '180321J': 0,
        '180485M': 0,
        '180488B': 0,
        '180044L': 0,
        '180652A': 0,
        '180369L': 0,
        '180648R': 0,
        '180255J': 0,
        '180659C': 0,
        '180471R': 0,
        '180108M': 0,
        '180725C': 0,
        '180117N': 0,
        '180596E': 0,
        '180022T': 0,
        '180244B': 0,
        // 18 Batch - Team 2
        '180119X': 1,
        '180192L': 1,
        '180123E': 1,
        '180071P': 1,
        '180162V': 1,
        '180527V': 1,
        '180146C': 1,
        '180526R': 1,
        '180012M': 1,
        '180186X': 1,
        '180126P': 1,
        '180352E': 1,
        '180030P': 1,
        '180635B': 1,
        '180273L': 1,
        '180286E': 1,
        '180553V': 1,
        '180062N': 1,
        '180348X': 1,
        '180630F': 1,
        '180664L': 1,
        '180059L': 1,
        '180486R': 1,
        '180536X': 1,
        '180463U': 1,
        '180234U': 1,
        '180313L': 1,
        '180524J': 1,
        '180281J': 1,
        '180029V': 1,
        '180594V': 1,
        '180633R': 1,
        '180257R': 1,
        // 18 Batch - Team 3
        '180492G': 2,
        '180449H': 2,
        '180114D': 2,
        '180213F': 2,
        '180424D': 2,
        '180525M': 2,
        '180711R': 2,
        '180009K': 2,
        '180707A': 2,
        '180645F': 2,
        '180325B': 2,
        '180562X': 2,
        '180052J': 2,
        '180475H': 2,
        '180335F': 2,
        '180582H': 2,
        '180118T': 2,
        '180147F': 2,
        '180537C': 2,
        '180048D': 2,
        '180572D': 2,
        '180610U': 2,
        '180196D': 2,
        '180167P': 2,
        '180269F': 2,
        '180632M': 2,
        '180371K': 2,
        '180420L': 2,
        '180718H': 2,
        '180482C': 2,
        '180555E': 2,
        '180626A': 2,
        // 18 Batch - Team 4
        '180148J': 3,
        '180295F': 3,
        '180141G': 3,
        '180094M': 3,
        '180007D': 3,
        '180247L': 3,
        '180552R': 3,
        '180704L': 3,
        '180187C': 3,
        '180565J': 3,
        '180127U': 3,
        '180259B': 3,
        '180183K': 3,
        '180543P': 3,
        '180587D': 3,
        '180364R': 3,
        '180660V': 3,
        '180377J': 3,
        '180109R': 3,
        '180294C': 3,
        '180670C': 3,
        '180607R': 3,
        '180240J': 3,
        '180211X': 3,
        '180322M': 3,
        '180474E': 3,
        '180239N': 3,
        '180053M': 3,
        '180509T': 3,
        '180568V': 3,
      };

  static bool isValidId(String id) {
    return data.containsKey(id);
  }

  static int getGroup(String id) {
    if (isValidId(id)) {
      return data[id];
    }
    return 999;
  }
}
